Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267732;
	b=Av/SBWUxXnEeCQWPBbg85V6S57Y3sA3AHBXh/ZK91nlSvVdVRH5NUOB/QiFev9LMjNKO
	 2CrY+Aafa8ryXReKRprDnfa7oON1hxe9EXx1ozvcPGQmqCZVesdAiQ0BO3Awn/ojotINY
	 xDaj2YH+WJhAKC/yCTtZeKDq46MKO/LbvhTBFN04eZrA96DgKpavHrIHQy7IKBXWnYwgn
	 oarClDwg0YGvc1r4MJbkV8jMKj3Kgwh6NBcOdMvtMyIqbmYxyDKKtaplsb/EFDGWpiBaP
	 On//abCuYrkOdho4hbGmC9zsHZZvV/oR3HPi0bts22ENNQsLyioveQ8WcF+TdI4OiPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=imi54UIQcMMOIPadZc5pCH/db0dGleBbmHd3Iwjq/sA=;
	b=AN2GXG/43MxgfWR3ILtPXiKNAYKdgziZnbxjjDkSwHARXSHDtZBBBhW7WEH2p7lt5i1I
	 x340EFIm4z5Bv6boVef0ih1erk1cIVIxuWevDxYsLf0r+hM9DM9fcifDsAaH5tHp8Dqqx
	 buSlGV4LAoAhhGsz40QWX5Iff08oXXW7JbY+Qed8Ud0XVlkDMPhtjVBSz/+DnHINfFydf
	 GYS2T7RYueWoz6nGHXqiKlQlswFlbGsIxg9/19JXLp8zeNiZQNH660HvCyNKnXSZ5tn0j
	 flFNv7VIqgujK0pNZnaTX6OIxtbay6rbfiZqICPg8VwCozPfTwP/bYTaWSB07xfCp2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zzW5RKE3;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BFE60A2611
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BFE60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zzW5RKE3
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1007556f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267730; x=1793872530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imi54UIQcMMOIPadZc5pCH/db0dGleBbmHd3Iwjq/sA=;
        b=zzW5RKE3ZLvXYwPWIxESaEhHqv3lRvSXT/Ozac+ewVT+iw1UkLGJCCzFUc/+W6atXM
         QnyTZ4tEZ6JhaqpFdW1HFQtlTEAvCl0iHZYJOChSHn0GeTPiAscCEKrFTEyiO3WTRgGr
         PQtGL2buYJOlfGTryhuNKpnjfLABWnpDRA4YKDqOOBuRj1DoPSs+21zS414eYs6AH2mY
         QmYSdiD7hudc+MENsHj2ODzivu5sIDNDeZuo7JF1+IplnOXAWytHKboHTGiLgyo1IhCm
         6FuI6bPuEemnEkTZmsQwsGuYCZUdQ42VNKYW5TStT3OeovzUJiCTGr0zvoUxzmh0UsEb
         Huww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267730; x=1793872530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imi54UIQcMMOIPadZc5pCH/db0dGleBbmHd3Iwjq/sA=;
        b=RzvS7oUXvxkqYHLJIWxMkUMY3iyzOIEdXcl2l7CIEpSJKUrUj0xcd9VfFOY7fmh85B
         UOAw4jjsdJrE/Y7BG1mu5HFMfnn1V3R6zDgItRjxuRwYqi//5CclJau5dkRo3GlclDxr
         ykpoeCrzu7JtHqCuK1+O1xxjI7Kvw8h0NVOunKghuTNOlDYbANtTGbaI9GJy/WXg6kac
         3dW07Gcb4kYIOFd4ixlyjEmXafECvdSk06B2XY2QVFulP4uXUsJ2NYuoq2polOoP5W96
         gGV8TmK0BfScre00ljQpSXM+zKaz62NUGmgwGjKhuVVvAO7cxNONJodwkFFcRMbuzgHm
         Xb6g==
X-Forwarded-Encrypted: i=1; AKwUvBwliiQq5m8JobzJNDATPc1yaS4A7aHgVypxWleurEznP9HaxRbWQcFdv5ehlg2vPAkJcGCPv+o7jB7oeP1V@vger.kernel.org
X-Gm-Message-State: AFq9FYJu5jnVHpJhzit7LPw1ubVn7rZbP/Rr2EhqS11xNTXnxudoh4Xu
	h8kMxIkJN481YUktufvR+IjZ/XRRcsh1Cu0SB+O77A9LIRaLr0l2c+Jrk5rStvKiKe4=
X-Gm-Gg: AYBFou2Ny3h9nv5B0jK1aupwQBRzbOri+PYwc+b6rZ1/MnlzKa7dvfkihdYwegu+G4v
	fZ9zZ6lfB+cPABAg+c6xtPyNyIzO9HhXy1iLrd8NqfyWVhMI1MLrG09Kj1H/Jxn/Y/kS3zzJEEb
	68+XNVUmUQn5CjKAalPbPl0c3AkDE0RQZA+ZUDkaOIOfxBJCBAW1Hgzd/PBera0cy2xum+QxQRm
	n0lTzl0Bp4iHXdPyAsjsJPpJxDNpMZEZQVvwpyUfEJ2WI5U3VTzZbWI7HZlAQrjp/lSglxQCJtY
	ojEqNIQIFcGWY/zKOP9ZVKjGUMeX4U4Pkg97Ohx5CK/PfdGZO4EthpUg9uTez5y1AyFbiZADWYX
	uqBXjRXycCbcxbwE9dSKQCpAp6bAhUJU5wOqMu4zsHnVZETAxvfCmIaGjYWfaOGglOsqyGVIUe8
	reXSRDqdyQlEkiA5iuvSJxaI9KsQWxTDOY8sAw21EQEPHOma5V1dJ05Wqd9pDcIqTRFXLPjzQhv
	ERg/9XTOzH0vyWl/z3ix+I5HHPBq2albHtZlak1MadQT8VVs/B6jLunI6D1ID+ZhL+3+gF75ZJg
	KjBZds5Gi5507VbL4rM=
X-Received: by 2002:a05:6000:2a8a:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-48e5d5e0178mr9303138f8f.53.1793267730108;
        Thu, 29 Oct 2026 02:55:30 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:29 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:11 +0000
Subject: [PATCH 02/14] media: qcom: camss: vfe: Add eof_seq to vfe_line
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-v4l2-frame-sync-v1-2-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=bod@kernel.org;
 h=from:subject:message-id; bh=r8I7/rYlBoiTs3XMbyfUM2Y/UeJQUOmnjTuddw9Fy/c=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgJDhjnEgkNKVNQNwb4JYzE3b0iEaGONJtbt
 xnwhCbBrGWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCQAKCRAicTuzoY3I
 OoomD/0ezDgAxXwhdq0p/DZNxB6vRZGKzg5HQhGajBH4dE/nhsLix589Z1DRnmnDSltK0ZS0ERp
 Ygqd4SCFqK+uWa9qGl6lmpzWiUTIaMwbvgKGCN3oVI7WB+J4O8Dy2KxECyWWaSIjZAkqCMVi+OU
 T90NRcn9zawK8dZSFOxAW6832Nk5j8q2fsC/taliDiv9snzHPpQcw/CZwLBRXa6FFvjOJuuvmdq
 Gkt+UD67jHxpWzZNWhHI+fU+oat/UQ/T0felYVHSCK0U7rmTZ94Pnkytyr4Q7fouWPWBeOzATlB
 eNraUpDEyoLgLALI1iZAA7X4JEJTwfufxkWzVaU/YGA2yXaPmVwCiV/GUqnFADotZiI/7yVJcUY
 nzUG+U+EFm75Ed5uEed5LcMYGcEpGJ7+z03xWxIh1fhDuTr0NyVc0usoDP3Fyjd4E558ZXU6FuP
 F3UsbeQli3EiRpMIXgWLn0+wQwQFSjOUZqwVjMaKceSYJfpdPyJk7CAQrLbMd17XhpyphfbS58e
 7Yp5jxAXlAz1AwZkARr1a9LdHj8nt7pGudR0jzi1NR3pIkANJWPWJv9FjOQl3ETrlsojrSYUTdw
 dATlUNM4Cr6BGO55Gh9gZgVPqjTjVzWLVcqdXO3axJ8mPZqmSMS/Yh7Emo67DWg847J4filP1NU
 rVGHac6FfU2JN3A==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add sof_seq to vfe_line - this variable will be used to correlate reported
frame-numbers to EOF events when the underlying implementation supports EOF
tracking.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a378..2d38133764b6e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -94,6 +94,7 @@ struct vfe_line {
 	struct vfe_output output;
 	const struct camss_format_info *formats;
 	unsigned int nformats;
+	atomic_t *eof_seq;
 };
 
 struct vfe_device;

-- 
2.56.0

