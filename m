Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D010637205F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768915; cv=pass; b=ZE/Tbip50X4uVZoHAj4uj8oXOdTXWmrERnjhOD7a+dZgibIWNBC1S9I3ZrTqPajTTsYXKqp/xEZeeWjPfpXsPv7u+FO5mFP0ucGpNlwSuPcD7rlNRQxPntscCJmmHvBRpzpVe55EUVdwn141qYwiL/U1i5DBX8jDORmCjgLOs6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768915; c=relaxed/simple;
	bh=PMRcSohxNKAPko8/kVl+2WR9uXa15ypsNsERd33VxbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ja9Zl5Np1erx4FegkbRMDKg+EmQpygVjmGcfuBt3DQNjs7l+gLCIWQBpJh+Ij8t7UPcMygt0jJVPJS8sEXv3M6yIBd/1n3fzL7BJsntZtj6+7S+bfSzjeCOGdRSii9IDIraiWzswpwSxWMjDVCepsudrKWjLiysoYiCmxM1drDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7XNSEHi; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7XNSEHi"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2092265a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 18:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768912; cv=none;
        d=google.com; s=arc-20260327;
        b=VR0bPQYEf8vn6CZQxMno394z94r/JsT+6I90lRVFFvt81wsoAHnyyJlXYmX0O4cPAr
         MeNlzD7wZD4NeknGjoqfm8OG3ViymFyF7BsWl3TDGnIVwpNmHg17VL40C7iuZQSjwRhe
         KkpaRRuYAwdj6oSbQMf072m7djP4mpRvrkeMkMMkHldsxrL/74w3J16x7qHS4uwxPVSF
         cislwnHtG9QrpOMcUWl/dFJDrkE1MaFEFLyeBofRhdFV49ygaNWuEGSjgq9Qr2VNi2kq
         2TsQUG5cQdoctKBw4Of9w8ENWOyhvCXioZ5VAmUe8NPkzF/+t7XNA0sg23GsA7l5myXR
         +10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        fh=vie0HW5KHkohoPTahANTuOb7ZcKp9I9S/zIAAyexPfY=;
        b=oek6bv5B3joRIDTk/JcvGl2u+j2uKlpwfTQmK2RFbEAVPuTly7d5a4aE1EyYdU2Vhb
         rA+aY+rgu1ZmB09H1lnI2VQQd6tMWFjl5Gr1Iam+ruM3x8NHvUCZax+loOJmLj9qH/KG
         1FyRpVaw0y1Bc674cLahFylDcZuvOmrkBiUHzyu9DZks5WXQcL3h+By7UL64jg/T25oO
         oXYfSw8gWAIJMvtKrcphJZfKvlEOKN09hiBx/Nl62vZhC9L8Py2M2/1isZvyKzackixF
         OX1JPDKvy9anUnWyV1G3H3le4Y2mqOC+vBpDm6+zrkmWKN43lRML47hocLsDHSCIizou
         gBaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768912; x=1792373712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        b=S7XNSEHiTZ4xhvGn4cxN96dhCK81xL0SCoBh/5tXeDQlyMUZ6Oh4prqhgjzOiYCcaZ
         oOtdK5icpo+ECMt1lCdi2veP7MxUMZo52aQZHxvT/95DJB6s5GW+cqkc2E6pKquj3Vd+
         pILdjbP4Mi4SqTnplQy3uapeQ0Llv2kXLNQH55vM3Y9W40KvkQC0GwKHKdjzESaMU5lh
         HzgZy8j38kXdZbo4vMTh/eLA/f13QaQjTE+zx4/r4+xTkaECSkVLN+E3S3Y4D3FKVy1N
         9wOOemiGoprhiMS7VRbg88oeLTUEkxMjBow5ve+AZ6iuN3fqxh8bT/Dsyq6NqNtn5fea
         1iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768912; x=1792373712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/kXiBrFeOBrXAt12DfB2NBIwep7UPRa6DIr90jxU4c=;
        b=LJwtEqV1psRh6aRes4hxfs2PvujEUmhzDt9PDPmzUZfnmDtSuPHD/kYT4AJeGikYKX
         GLr26GfUEcuDX5kZ0aiepXLtLFb5+Oj4wcY5pTNaMOTKswCW+GKre+NJw9+ygdNo5Rv4
         deoEcP/pzgH5RVdAKEyGBxIbEukHkIkllG4hpIa3NsvsWdWzmrXSEkR3CAKHYQBpZVU0
         FjpoDIxuBme+JdvF3kIswaVR/xzPwrS+2bKMo7h6jIEwBkpj1rf0iV6d6T+U+B5QSxvi
         T7YGLUVL3vCeCu149kWRT8pfJUHFJ72MeNLo+Obvuumq7VJl0GNeNW5k1K4WHbFwssy8
         0T4w==
X-Forwarded-Encrypted: i=1; AKwUvBzw6r7iwUDiYEkR/9JTBjFlqeggu/R2aS+Jgji25KxuVG7dudUM7qNS031Jn55e22mzVgaRh2j31Enk9rpu@vger.kernel.org
X-Gm-Message-State: AFq9FYLPV0xjeLiQ5icvBYwliG3CR6gQT5H1ffANHc+6GTfwWMlWUT5E
	Uf4+fwEjYBO5mX6O87aX3v7b6F/WAFT8cVplW/73HZScpdiC/XDL/2Mme6QGMi+aCpzk1bwFQOL
	Ltovq76I6YyFjVGIPSJ+k1vhx6Zp8sbY=
X-Gm-Gg: AYBFou2j/pTvZ9DIo4oHYsj9VqZCjcQTenoeSbQIEJ2pAcuu9mgqbeZbRJgehajC3YS
	APYlNhh3WIEEkNtpgusf9tP+/WSQpHfNGonHRDuLV1ESgrrbIXVXf7FZZ65eQW8vJegVefE+d2A
	QJyOKkHF2HzZViQfih+5gMZN4Y/1bBUPs6VynlzaUHqjsNjodPt346Qlf+OheiptWSitgUC78wR
	XXeYuKfFoRBUtyz4cc4lyYQI2iA9B8XKJ9z+TPTPEM4IdFupaBm3KsGfxoxquxmvp97yKxT30L6
	orp8/v+KEss9JyFH4n0RjMQMbNwAS7aLclxDexA46l0T12xdrrwWNXc=
X-Received: by 2002:a05:6402:a0ce:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b1bb19e48dmr1653193a12.25.1791768911701; Sun, 11 Oct 2026
 18:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>
In-Reply-To: <20260827-apcs-v1-1-33087bf44620@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:34:58 -0500
X-Gm-Features: AclHuK-wSHQEHwchdDebJ1vxNqwtw8jXYVnXM3lFwyE-VJGEOVOwBXaUkTBV1ZA
Message-ID: <CABb+yY2XUPngcEVBoT_pQGgGjYtjD5iWJDMDXJKCtq0Sg+fBVA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPQ9650 APCS compatible
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:18=E2=80=AFPM Varadarajan Narayanan
<varadarajan.narayanan@oss.qualcomm.com> wrote:
>
> Document the APCS mailbox compatible for the IPQ9650 SoC. IPQ9650 uses
> qcom,msm8994-apcs-kpss-global as a fallback, so add the valid compatible
> string combination to the binding.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.=
com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index 39bc374300c3..11f4aaf256a7 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -39,6 +39,7 @@ properties:
>            - const: syscon
>        - items:
>            - enum:
> +              - qcom,ipq9650-apcs-apps-global
>                - qcom,msm8998-apcs-hmss-global
>                - qcom,sdm660-apcs-hmss-global
>                - qcom,sm4250-apcs-hmss-global
>
> ---
> base-commit: 41243c778cfc83f8d70600be6dcd0c7924603aa8
> change-id: 20260826-apcs-43612991b1f3
>
> Best regards,
> --
> Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
