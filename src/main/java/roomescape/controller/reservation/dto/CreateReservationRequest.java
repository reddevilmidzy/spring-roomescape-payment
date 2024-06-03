package roomescape.controller.reservation.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import roomescape.controller.member.dto.LoginMember;

import java.time.LocalDate;

public record CreateReservationRequest(
        @NotNull
        Long memberId,

        @NotNull
        Long themeId,

        @NotNull
        LocalDate date,

        @NotNull
        Long timeId,

        @NotBlank
        String paymentKey,

        @NotBlank
        String orderId,

        @NotNull
        Long amount) {

    public static CreateReservationRequest from(UserCreateReservationRequest request, LoginMember loginMember) {
        return new CreateReservationRequest(
                loginMember.id(),
                request.themeId(),
                request.date(),
                request.timeId(),
                request.paymentKey(),
                request.orderId(),
                request.amount()
        );
    }
}
