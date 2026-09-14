Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132947FB19
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398820; cv=none; b=VSjbOKNWDa4CyyDOhhK8KdlrMR+M1CiOc8jdVjsLP5GuBgR5YyswhldiVW6pRd+xt80QgSvG899lgpouegxR8dFakQDpHmy/5Z4fRfrTsP53Mr8MrME8/moa6TOoZ7Wp5HeJlZIdvXQGhAYX9oaL988fJevL+EmeGc8gz7yZH3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398820; c=relaxed/simple;
	bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0sUr4LLvsEEGlhUx+9mtEPE4zsj6uDphtLLKISQhQyOKZLav0YwS6TlgMnFnyahdzckPDREssYcS8DdSdgL2XvUFB2D26UHP0jKZAn7C026qVE4/V75K7FqyLHhxCijv7vYfFyflSo/v51V9RJ8YsGjo6o6gYZ9xcl1miFMVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nP8VjC4p; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nP8VjC4p"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b76515c0d7so3125435e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789398815; x=1790003615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
        b=nP8VjC4p7rBsLC2Y8cLpU6cO74nfReqhzPSY6dEKRZodNt06OJQ2t2FGkcAC+VkCrw
         xprFfdZdnTupRC+evc3DH6SBp90HIMAF6KJj1BU4rWmCS3lWetEumintJ6PK4vRlpv3p
         GXkMMNetg0YOjA5inkDlPaeR6kZd4tYA8B3Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398815; x=1790003615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFA7B1Zzm+M6TOI4RFrwiV6L7EFm/dOdjC0+vMkdzrE=;
        b=SsQ9Lw8U399/G8NA7o5iW6/UrslKZ3964NB1M6p/S4Q0xpkecxRz6UCYbD+54220z/
         eV0UWGHQiDhwqAa70LiLgB+AnhG+uNqwwQO4FoQF8g0W46L16Y9cTrB3do+Y2bsn1K9j
         xBthPxWmPEWELzo/0sLh2s75CF8bdwqjzbY1NCIuxoJv2g/fRopNzIr9/Sq9uzT1l4t8
         azTs7noxsCR+IAHnhXMLasn1SY5MZ0D0K4d1B5bJcdo/lKFmwB1tFcAg/NLSju8rvBsA
         Y3h7nlh2aHf6WoZp5efb9onVO9X1ZtVctCCABKHWGI0NYJTdmWTnMMgW0/+Wdk/pBbgr
         D5Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwxoOtU7V+/7W7/w+pUTL62t/+A2jvGp3xrmTjI3oboiQ3T7LotgN7o95s8AjnOGt4hK9Yot0Q1e5QG6R+7@vger.kernel.org
X-Gm-Message-State: AFuF++kK0pHZIOHh4LzFFHB9DzLHBcELez2KFHaGiwE/BY8+1g9AVW+0
	gBEhDKSStTzHSbLPyifJSxzka59skfJHVcDWiTVbHCcZpibPPbE19kKQSIjzF5KIF3bXmfyWAop
	qZLd5cQ==
X-Gm-Gg: AYBFou0dbTy2tOZP3jJUZTl99bWE6js6IS98SIaD0t4q+b0nnCakBOglgKd2HpVrhCS
	+ApxB862ZHd1u02YupLchaRO4vRAT9zJpfPHfMQk7CQK9m8etzlqwNcAsDyknMu1LfmnHh3kia8
	q4pl0oEdNJIq3cm4YVrnUXTaV05fBRwLJnV/bqf4I6zonWnT4qC63g0XesJD1s6mJ+w0gl/yqpw
	f2pckhI7baU4Wh/sXuirZY5Tr7NfqcqtoSEi8bxtITpRajFc0mojEIDZn2hSA+5Iyqdf9qjjBVW
	VYyulLyZ6uO0xv4s7yleF8iQlhmgfnePpm1T6aV060O1O6rZsPY1oEFHVZvKyM/HJUchoyU9VU6
	00+SQWV9eTgQx1B+p/xzuyhYyMePLDjudX2E0fggghGHAmmCZG2+rNtNj7MN7voZR/nBQNEZl8W
	mNGY9mgLEfqKprOR+SqhV/FFIKKftCm3jlUu+bKtlmbZJg8qJeCN85z+RqsO8k6t0Y1FVeCB8Qq
	UutvJ1oxWUaL55ofVjyZ0esM8NDQSuW/CqbfA==
X-Received: by 2002:a05:6512:135b:b0:5b7:668a:e8cb with SMTP id 2adb3069b0e04-5b8abb0ed04mr1199856e87.31.1789398815432;
        Mon, 14 Sep 2026 08:13:35 -0700 (PDT)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com. [74.125.225.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm2658846e87.80.2026.09.14.08.13.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:13:34 -0700 (PDT)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so661378f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:13:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByv4ZmRit5awHM8oK/uBw7uScVdRZRITSuznPytl9bWKzSNlJlHp2IgHqb2tttXEFEhul7G5BZIhkZ/ynJJ@vger.kernel.org
X-Received: by 2002:a05:6000:1acb:b0:484:3147:49c9 with SMTP id
 ffacd0b85a97d-487028be8c5mr4006418f8f.2.1789398811422; Mon, 14 Sep 2026
 08:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com> <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
In-Reply-To: <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2026 08:13:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
X-Gm-Features: AcwNN1XNTZvJpFGb6MbsUkQxxgT0-VHyrG0ryskn4Oe6UeBRJylCSlvDiAONe_A
Message-ID: <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 14, 2026 at 12:34=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.=
com> wrote:
>
> On 26-09-13 21:18:33, Srinivas Kandagatla wrote:
> > 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> > Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
> > delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.
> >
> > Assisted-by: Claude:claude-opus-4-7
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.co=
m>
>
> I think Doug starting asking for EDID dump in the commit message.

Yup, please send a v2 with the EDID in the commit message. See all
recent commits to this file for examples.

It also looks like you are adding the panel without having access to
the datasheet. That's an OK thing to do if you truly can't get access
to it, but I'll at least ask if you could get the datasheet to confirm
the timings...

-Doug
