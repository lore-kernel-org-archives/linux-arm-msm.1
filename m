Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5537205F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768723; cv=pass; b=sZFBwBjJee6qYlkxj8VD853i384FwTmKrre3U7S0boZ7nYlJL/MUS29XDSHsFrUmZwI8Wie6tUZVJKzL1dIZ/TZbrxL39w1VJpoKL6jZthTK9UHKjA+AiKV7TdNWvWGb1q8uktHUhfHGK0xkM8IFYVVXvAzyCx1jfoA98rqnz7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768723; c=relaxed/simple;
	bh=vhUDDHake6PjVodeFYRTd89BpqCVb70Env0+ub9W+Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auU3MJAJY5+hiD42IvTv/bgjuKx4xJdJtnw+iwq32CedWDucx2tTjX0/QujpWfMJiDzzswhEo4wgEMZNzn5RecwvT4NS/ZD6EjX5JtTNAOiHO+bJSNaqo7ntsOGA3lLP5kEdOJDzThed9WCdDwlo6f34MRWU+FNWcKexyCddAIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCGQwL4a; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCGQwL4a"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-483a66818edso792772fac.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 18:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768720; cv=none;
        d=google.com; s=arc-20260327;
        b=Wk6jwJI0v8gpKLZAnOo1oH1Z9PBJBfxABx++sa22D4CI9usTu59nC+osoEXTIqk6TI
         a3ynqQeLctMyqx7TIrvmsYB0fBivJyIYY+OTRbK4HUF9knB0FhTfV8Psyevfm2uF31+4
         yEQaYDcITAJ6RkApMTvGqRqhaBjzW3ElBqUcY9o+1wFEKizpE9DvJbrl1glh/J3PNdOP
         HePGQdIsxyKnW4Sntoce10ihIYWLv8FofCL0U9hsugAhE2hS5rQ0LzptFjlMb8V7IkXU
         vMCyjlwduF3FkWwnI1EbntfxDsqw6cPDzedMMdcRukacdVlSNrogLzuMUzCuLf/Xo0by
         qSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        fh=+Lk3Jf6JhOwevfAhWRXb4LuQqNfCysSKmFB7sTeZYzk=;
        b=ctD59LBHZxPehNTAEafHjmUt6j0vFJJqygX4kLLWnSUVmUR5h8IKhwcyaC8SNT/8NU
         qGVyduM/YiYibsj68Hh4zWOl9kkjXykrdlBjm/pl7vOOw4jacz+LwRVa+NIkgynnNjRz
         L+IqN02EZRD/N7pBe3l1CPEiv0Him+wq+6anCpaMG19BdMu1NvT091MEjcP27990ESaC
         zitJSVcu+Zf9d4LsYCb2vtGf9k9dQC8mV/MiX+qerVa3lSvrDE6Z2gCsT5twgZib92Ky
         tHl3AtrlEsYLmoZV/mt7+yGLFliNrCd8X9oxoTJqUchUFqsJvzC4lRi6MlDAWJUim/6A
         MVQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768720; x=1792373520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        b=GCGQwL4ab1od3moolhk3hHqGU4woVDxfP/nPc5Z2Ra061NJhVqGDZqpfeQ+MpOV/Sa
         PFhkCfhjfe4kgJ4XxoXFqs4HYwiUWlu51BB2NILtfl+uixL0rcCcILPI7bIYFMzgGOpS
         TUs6/NKEcMmCBIMeAbF6iF/RKinW4f2yt7qd1q0uGZCC93M8jrpkPL9/XZ93bpK2Ela4
         c2uEUbLAo1BGHNDs6oeKp+txknqWavUpSPWc020TmDblTzMIRdYLUa1viSmRxdtqV+wS
         PI5HO3HsF7mLbB1Uv1XHuhywQJ9OPQkAk07guSXjoGi+v5UU8uI1nzPqC0Ev1izC91Cs
         AIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768720; x=1792373520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        b=RjcWZZXdKfoISdp3f4QMC49t5BWPq9rsWo0cKcfVmWPnaVRvQcCd9lsWg7P5Ff3odp
         ffIXzE92MHPhK+XO/nAPW5AoA3g8kqL57rWfnfuBf4Nt+xsppM45zpU1KHNzUMnBw0y5
         QM9NIpHA6H/RK07N+FntPlMfnS1gUsNXv50yyfmcvRnTk9R7iWVARxSuAVBq6uD20etQ
         o4kMeuDcTgv4FNwsUK5ijeZPRj6j7DNCgxDxy5iSkrXt04IewITp71tt707f6EsuWveu
         FY3Eyr4r4BB9MutDWSrvzyTChZnkbrVoAtRQmG6/Z9FP7cgXTFbjr1w0yGRCYv10lCe8
         E0xg==
X-Forwarded-Encrypted: i=1; AKwUvBzqatqwhIqg/yFO3Jw2QF4tCD5enANxAHt3kpXmeRzhhw+dbhVOyROQMl/OeCc2pjoJFtrVjkwlUG3qw5G0@vger.kernel.org
X-Gm-Message-State: AFq9FYK4cLspfVpitmMzDvHGMiLR9tb16BtFi/blJ6B2bCmQ9tRxbXeb
	X02kTmMf1JFH2YwYnR4SYR6iv0O49HE4reN9YSH3vwu5yIATHjWdGblt8S5yF90I59J5gkrfbqx
	NlxWwtnMMBhF8CxpoXwN8jHE5flgp+hQ=
X-Gm-Gg: AYBFou1rc3pYfqQ4vVVgiuTyXA+w6IC5G/3ghgFx32Xhad9BOGwwHIICNJHy/uLXWnO
	UWK/v6GHBSBmWAdpCyV0TKBfVNhT/eLyebz6Yb5FUnHVLxTbLaeyOPK/bHsNkUPeUzDWzzomBLg
	mYO0PTCrpauoMqnIbHgze4v38N7FPwv+vGPOug1G5ygKwjtl/eqFApYmSNeyUKYjpNxmF2WEl2e
	aVKVTyLuAWYmkpNlDWR5JOgv0wCzit88/5dJGH+NoAzo6ww6G82V0rozORgdpUUur8P/WQiHEuq
	qOpC8lPW2IMUQ5CjHIyRqfzy6gaaz4Cc9NUGsV7R4a/fj+wcYX+EpBs=
X-Received: by 2002:a05:6870:b523:b0:451:22e0:9604 with SMTP id
 586e51a60fabf-4a2a86aca5cmr6021572fac.7.1791768720455; Sun, 11 Oct 2026
 18:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003175659.23536-1-mailingradian@gmail.com> <20261003175659.23536-3-mailingradian@gmail.com>
In-Reply-To: <20261003175659.23536-3-mailingradian@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:31:49 -0500
X-Gm-Features: AclHuK8whbaG7v0eCCsuN4wni82p4hRfYmu-N78P0lmjY_ExUyztPMiJe-8P32A
Message-ID: <CABb+yY3gCzgVL1qZ7XCapkUBr4MGfUO8NG3kXY_3QL9_pkHo2w@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
To: Richard Acayan <mailingradian@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 12:57=E2=80=AFPM Richard Acayan <mailingradian@gmail=
.com> wrote:
>
> Add the compatible for the APCS in the SDM670 SoC.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index 39bc374300c3..74f24e07abc3 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -50,6 +50,7 @@ properties:
>                - qcom,qcs615-apss-shared
>                - qcom,sc7180-apss-shared
>                - qcom,sc8180x-apss-shared
> +              - qcom,sdm670-apss-shared
>                - qcom,shikra-apss-shared
>                - qcom,sm7150-apss-shared
>                - qcom,sm8150-apss-shared
> --
> 2.56.0
>
Applied to mailbox/for-next

Thanks
Jassi
