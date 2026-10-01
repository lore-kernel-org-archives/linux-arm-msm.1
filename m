Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928CA4E8DEB
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849363; cv=none; b=bQlKYy1reyn1m/+LEFBzkhgKgvFsv4+a4mwSKcBHlRudUOn6daXqL5qOJjmZksBXNbKL2MWPSSsXIwA71L/0xYQzHH6mWrXEjEVZYG8MH8z2GFtjuGb3zm17nUMY65QhRmPYLXEZdU4V6beZzTySDy5bhnfw1NblLEG7qDvrqps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849363; c=relaxed/simple;
	bh=xprPyU7TrusFfOa1PFgToEkbIpwlSZwvH7LAs9IVOQI=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=HKVPP4qSVhqopvBnbxOFVVrE5TSP8gP5ZYcEduQUCe9mxiLXMTuy+DShmH6gRvKhH0f3pKrhfnbkq7sfNWJWcHFr7KBpUfg23wS3ve11WYOh0uO5xSLTzucIOk2H1D5zMcHqgMQVaiccGHk+HbYeKFy5wFq/V7gd7bbX4V3zv/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=boyJLL1D; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="boyJLL1D"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e20bb4583so238731566b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790849352; x=1791454152; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PmIfg7X274fPHQkgHqjnd/g4+a+Z3V7hCSSiuLRRpOk=;
        b=boyJLL1D6RhvTsaCOcPUIz51StjRn5mta2IqI1yNX/WCN9sQ/zXlURBJcOxpooO3RQ
         b3Rg64EvDcEqitIiYJpzLvUjeMDehaayewTqkM+923VKMgf+uHoD19Hn6ESjmxViLmKt
         874pwt9uFyvyBl1AMiefSiTFwOzwz+V2JopbvptxQNX/qE3TKbRizj6GSU+kfC35GfC1
         JTnvJ3SNjiqSFuNXb2oPeVSBqnAov8ego9wUmPnohD9QO17WVDNtcqJUiIuQKJH1qhlG
         ahmYaOod3KVsQhEKU9PC5ZQhVHETQ/UjyGXBJQaevwv4OwNBujer/QhtOMv+r5dl+OTa
         yWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849352; x=1791454152;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmIfg7X274fPHQkgHqjnd/g4+a+Z3V7hCSSiuLRRpOk=;
        b=PoAfeYrguHtMUXuxo04YWh3Z1F6xWbzih4y2PDk4QQYz/N1ou4ZdG0e5vks+jpSUNO
         KjPI4U1iVAc2H/HLhRhHfhdB3+QpuzJwmDNs3VgPCnuRg+rlFZnaCv0VNNjTM+XqXcHZ
         OujF/1uFhWyUsP9rqy1rmJJSNLJgi5IsgPA11Zfn02bYMdb8dir3/bFHfdR89zZhrEq4
         OhEw0qCiFMCvD/OUICD95mVKuaxR8xP8D2hB20H8QTr8RUSMTMoxnXDRRP8uUZ+Wl+2y
         +TNLiL076K2L22mYNUCPENdfb5phyAC/GsxMPzBJFeqc1PUsLF7CYklAM0BWOjm3d0Ia
         fVWA==
X-Gm-Message-State: AFuF++nNp5n2TlJ4rBV3m1DcAlW4XbFTpco82dPhpAK5kdEm7XCMBPJF
	HIt2cU04DIsTUXo1M3w1z2nrkVaws1u/vBLRYrp9aBQjio4mK70c+Sh6HtNc6nTF4UA=
X-Gm-Gg: AYBFou2l/hfqhJIRW1OsH07aoH5vjaJH0WA2/MgoH/DJEvfELqhzhDbkA2mpLvO71Zf
	56g+C3ym/KY5go/K13t05+T1rrRBxc6p3h69dvKEt9fsw1DhOr0VFVFCQK968hFsQ0X7zDgaE+k
	YLTqeL/JCzjO3E7+jIn3i0+g38vfRvNaC76a1rMjFJfYBYByA0qYltFlNu31KJGPxbYWGVc9CWM
	89e/GTQPj+YDUWWYmXRsHSTs6W9CBo44QuPaCmfWpvtL77Yq1qcqhKyG2LSj3mhxomBWUFL8Lz2
	qk41uHsBrZoyuz6KA47AmDJSoJEvpdhQGgfuOevrB3yihu2/L0N/whdxw3t66RakmCAHQC+sVWJ
	EzRnEeL3EK123H+w/tvicvmTdZxh16gHRW/f5LFgeSFnG+8qSEp0LXu6qzlHQrcGXHs2uqYkTn6
	ogEiRwg63Fj/lAZoQiNE/swWp66Ep1A55gSinVEH9koKc/c314GiMXOMqm8zRWDpPWOeFpJhZ6d
	SclgB+hW0A=
X-Received: by 2002:a17:907:6095:b0:c2a:50a7:d052 with SMTP id a640c23a62f3a-c2e2374b5afmr337709266b.7.1790849352212;
        Thu, 01 Oct 2026 03:09:12 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.14.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce362esm123790566b.30.2026.10.01.03.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:09:11 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------WLdK11N4WwQJ910wlPBOAesZ"
Message-ID: <89c86aa0-b1ba-4055-8835-256030828068@linaro.org>
Date: Thu, 1 Oct 2026 11:09:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
 <20260930-purwa_camss-v3-2-0fe2a5b11208@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260930-purwa_camss-v3-2-0fe2a5b11208@oss.qualcomm.com>

This is a multi-part message in MIME format.
--------------WLdK11N4WwQJ910wlPBOAesZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2026 07:57, Wenmeng Liu wrote:
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..c401d4d2367022022ab4159d5a08806c27990f00 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
> +	case CAMSS_X1P42100:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -2014,6 +2015,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>   	case CAMSS_8650:
>   	case CAMSS_8775P:
>   	case CAMSS_X1E80100:
> +	case CAMSS_X1P42100:
>   		ret = 16;
>   		break;
>   	default:

Lets take the opportunity to collapse this switch down to a default for 
all of the new stuff making the old stuff the exception.

Would you mind picking up the attached patch - assuming you are OK with 
that - add your SOB and resubmit the series. Then we can.. drop this 
part from your submission.

The ever-expanding switch just needs to die.

---
bod
--------------WLdK11N4WwQJ910wlPBOAesZ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-qcom-camss-vfe-Eliminate-ever-expanding-src_pa.patch"
Content-Disposition: attachment;
 filename*0="0001-media-qcom-camss-vfe-Eliminate-ever-expanding-src_pa.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5YzRkZTQ0MjcxZGM2YjQ1ZTA1ZjY1NGZjNTJlOTRlMTFiNGNkYTBiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBCcnlhbiBPJ0Rvbm9naHVlIDxib2RAa2VybmVsLm9y
Zz4KRGF0ZTogTW9uLCAzIEF1ZyAyMDI2IDIzOjQxOjMzICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gbWVkaWE6IHFjb206IGNhbXNzOiB2ZmU6IEVsaW1pbmF0ZSBldmVyIGV4cGFuZGluZwog
c3JjX3BhZF9jb2RlIHN3aXRjaCBsb2dpYwoKU2lnbmVkLW9mZi1ieTogQnJ5YW4gTydEb25v
Z2h1ZSA8Ym9kQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29t
L2NhbXNzL2NhbXNzLXZmZS5jIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12ZmUuYyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12ZmUuYwppbmRleCBkZWYyZTFkZTBl
NThjLi5iOTJmMmIzZTYwNDRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3Fjb20vY2Ftc3MvY2Ftc3MtdmZlLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9x
Y29tL2NhbXNzL2NhbXNzLXZmZS5jCkBAIC00NDUsMTkgKzQ0NSw3IEBAIHN0YXRpYyB1MzIg
dmZlX3NyY19wYWRfY29kZShzdHJ1Y3QgdmZlX2xpbmUgKmxpbmUsIHUzMiBzaW5rX2NvZGUs
CiAJCQlyZXR1cm4gX192ZmVfc3JjX3BhZF9kZWZhdWx0KGluZGV4LCBzaW5rX2NvZGUpOwog
CQl9CiAJCWJyZWFrOwotCWNhc2UgQ0FNU1NfNjYwOgotCWNhc2UgQ0FNU1NfMjI5MDoKLQlj
YXNlIENBTVNTXzYxNTA6Ci0JY2FzZSBDQU1TU183MjgwOgotCWNhc2UgQ0FNU1NfOHg5NjoK
LQljYXNlIENBTVNTXzgyNTA6Ci0JY2FzZSBDQU1TU184MjgwWFA6Ci0JY2FzZSBDQU1TU184
MzAwOgotCWNhc2UgQ0FNU1NfODQ1OgotCWNhc2UgQ0FNU1NfODU1MDoKLQljYXNlIENBTVNT
Xzg2NTA6Ci0JY2FzZSBDQU1TU184Nzc1UDoKLQljYXNlIENBTVNTX1gxRTgwMTAwOgorCWRl
ZmF1bHQ6CiAJCXN3aXRjaCAoc2lua19jb2RlKSB7CiAJCWNhc2UgTUVESUFfQlVTX0ZNVF9Z
VVlWOF8xWDE2OgogCQl7CkBAIC01MTUsMTAgKzUwMyw2IEBAIHN0YXRpYyB1MzIgdmZlX3Ny
Y19wYWRfY29kZShzdHJ1Y3QgdmZlX2xpbmUgKmxpbmUsIHUzMiBzaW5rX2NvZGUsCiAJCQly
ZXR1cm4gX192ZmVfc3JjX3BhZF9kZWZhdWx0KGluZGV4LCBzaW5rX2NvZGUpOwogCQl9CiAJ
CWJyZWFrOwotCWRlZmF1bHQ6Ci0JCVdBUk4oMSwgIlVuc3VwcG9ydGVkIEhXIHZlcnNpb246
ICV4XG4iLAotCQkgICAgIHZmZS0+Y2Ftc3MtPnJlcy0+dmVyc2lvbik7Ci0JCWJyZWFrOwog
CX0KIAlyZXR1cm4gMDsKIH0KLS0gCjIuNTQuMAoK

--------------WLdK11N4WwQJ910wlPBOAesZ--
