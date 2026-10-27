Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074184;
	b=hipwrPutFP4QtaZxluPqShyiV5xnAR68IL0Ttrg/DZjRBelGDyphn5+9INob/PtPDLYp
	 hr3W4YiYGy69U5p8Weeq9e/Y8N6M1CG2rn6qWl2gmMnbybkAEF9zLVM3QcSno8lccBm07
	 Inc7wtfsD1Q6pTs7Q0GirBV/nbI5XX73s+GND98q2WEiqe4W6mD73buQaG29N24nH1TUm
	 YWbILMabtoMqOweiXCRmxlzcwnL1yczg4axuLEYNCKPIWpI2YO+sAhsD576PTSMwmf6q7
	 UpnpDw+9cfyTqdmWxSRt9BuUMzpxf3LBExGlrIcsUDZZC+8DOY3qQphqZCKYFLllfqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
	b=UPcO33/z+i44z7P+rA8/gQahJX7r9AAg/S/97jNooOji6qZLb0pyEDn2BPFOfgrdXmbr
	 a/9Gr1yYaB5sHs/RYn7KI1rv8VEiKrcxnjo1+C2tUyCh0hzMTvCKLtzBYPQMUjyZym7pB
	 zsP7jsiQJZrQ+sw2O7IojF1EGFdYov9TTqTklti3pJvqXrgJXe+HzCVeXE+jMyn2xdA96
	 U13V5tl38I7gxVt2OCxUhKp1bn40qM+scUb1HA8iL3sXHITKFaQRrKA3tW/Bg3y/qY0Tm
	 iivV4lLYAtsgbT8bQ/PomEWQnyDNQV8xA8/zjDMT9ip31Ww4bfy5Nllr4xkbs6NH9pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrp9PEbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b30dbn0E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68578606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68578606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrp9PEbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b30dbn0E
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F2O3512082
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=; b=Jrp9PEbO8E+rTtwv
	XSkewXOHXjc+TWaVhnoZ6nf4ZFtVGFBK04sY3ZiyxEbIQRfaKny46gNp0YUwTvuu
	NYUuzhAOIAxEngvKL/cB1c0SuThts2znYxF/8dAqY6NSmSTJV6RBC03UQzSi0oo+
	xMVUhiq3Cedqt2kcG1gP3BlcqSwgeFlTTnr4zKbVuipNHQRqCCGI0fOptXrg1huv
	syhhbPeratSZ+7dDB85YuLBtIRcQHMkmx/J3VNm/MFln9x4u5dr5Wo+/CRqiZCZq
	dH6LHfqmNInKqB1LpQlk1BFlCd9rsMC7SD7fFeKyrJeEGLCdl5ch4ya/i0qt4C7X
	Bh1ZPg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cpbr08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:09:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eadfb67611so662595e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793074182; cv=none;
        d=google.com; s=arc-20260327;
        b=Fs/YHtwl/tWuZpy/AqnekzD0RWFQRr0GIet1k7itD+2EVvJedooBTXNanBUZfXu7Bj
         88GT5ziOLKxdwrE6HdsXC86hHerNU5QhYWk8+RseVwZ9BVwfUO74brLDTp+DVzOtIuSH
         pEDeFOIBL1na/Te35O3FhGaF6q+DzfGqdvJJv2e1UynMX25QZCUQjU+4r9oHRMzWHKAH
         1blbOVh4cDt4FTYDGmP1jKyAAFZmO0lTssBCOPN3mDQ6/bzAiTMUVqwpDXKaCC+4iMVo
         NQqRxHLtPovkeWSf8YL6VWS7bGL+iVqi7/WIdne/Et2HXz2T6ylbUpB2as7YmuzOmEnp
         y/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        fh=3cuTfpz3w67KN/6W27F/MQ8fnctPkF4ltJAsOSfpWkk=;
        b=XOLVsVyzecRa6DtIYJCc9q2navgrv4YjF9VWEx7/Hmr6ViG0Ey8P3J+6NV/tQg/HlV
         iLVGME1/cd1Y6cT+YM0uo7uWfamml3+WNCqUZ1O12fnPivTYwzodaYdwTXi057x04CV6
         1JQAnF0+YGI9tzOhIXji22HfMPQoQkDebFontx5udpm5Z6NvVGBIHPxkXujjPbd470bu
         5TlaW9x9C3qrxAr7z/hb7HOEgV586H/9Z1ivNe2/0ETUPz/bXprt1sidvGck/eW0Hnj6
         JBaTXkKsT4elfQa/gKjBOGsddaPPpIscnG9EA4sPU2FsPVcPqJDypr1ExPO9hg/usaEW
         a8wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793074182; x=1793678982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        b=b30dbn0E7eSYHbpwzUA+0uIauVn2Y3xZPyisawysax2bqq0jasQNx4r2MptFnybCM1
         p0Qms1gMDsIyobp5o16PCJILzAR40S8zjx9XdCPKXxhvVtYufNxjEHPtThx4lNXVtcG7
         quNV7MevjT0SJstZsPNyxgCyQ+qB3IuNrR1s42Jh4rWq/Dk57UwJPTdgf1O6DSv6tBjo
         O9cCJmB7Oow9m8ziknLFJV22pPrscdgtauctwN+KMSDPDxUWOum+OpNCSBlXklnI9C7Y
         feLrxB/TNZeYYbG5n8OnHBlLoWNTn4mjSeL6pvQVehKClw68iO5ddi5WBMp7Y82tLH8h
         6NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074182; x=1793678982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY8JNXJBEmY2//YzxHAKXEJvbfSWEbX5W88WIsAUIF4=;
        b=ILYND39zqZCYP0tCD2pudDUT6iGrIFR9HYcAB3pm2fYZuYsJ8pJwnyA+72Mfzmirdx
         9F74WW2hgpIx/GPNbIMAdxcU/24ZphSlU3SmVOJG4zu+1OnbErGe2TnLl1eIBdi5orQt
         To1/lth1sZBVyefkRHKCvsBpPoEnIdF3bcI7v5S9nlVH0iSUmKPmjHSDxT0fer3SwUqh
         9SIqEIi7ZelTcRvDaJYInAQ+i08e67JkT44t6iZR68DriAPR+BS+a8RTDLQBnwKXIe2O
         B3Ysx1VMu8wB1CtZ9tgRffjlzxfgXNI2IoJt0XgJvfZAQTNNF+eSvQ8/aenqheoHdn+Y
         PGMA==
X-Forwarded-Encrypted: i=1; AKwUvBw2POvS1mLq7eTFiaUe0rBXMTZsoHAnNnhTUxo6xHkd9H8xDaz6cay1vQLErodEjKPdtcVJ5NabU1bqkqwO@vger.kernel.org
X-Gm-Message-State: AFq9FYL/4rEsE2OEVLAKC/Sr0rPrSaSt/sV4JHxO0gGfLCF4CiadzAO9
	86xRm71maGRtV+9fEnRpPUJTOjQonKVM/G6ugFCOcr77V5AO6ZZAHfJhgSCnxesSlBYTtEVnQhd
	p3RJQ1W0kDGz23DPdfelIKSoFyFyxk1zqWBQxB5uLLEgJou9iIMc4Q1ioOCbXt/D2sRA2J02pjQ
	MavpSxsrYakjHZq+oP/ipOBtLHheYzTpdAKCfCZ72M9AYYmslRGhs=
X-Gm-Gg: AYBFou3Qvnxom1zQ6oDf3FVENY3uBj+AmbgUDVONkJf+F+aunKewriAeTq6TNciJJft
	HE9H/ZRzj8aJ+Q4ZR3LKQ34QfTS1UxvInzqQWl695i54FDEkbfh0Wqb6NrLwGOqOEsD0ojUIjD6
	9AsDwLgJQzuaaEXqIoNy1HLmgY4KgssN9j0cBvkyJNwoer/x5HHUgVbshEfXYZOJ63FBxhXcN+P
	wlabnUnNMIy1+t32w==
X-Received: by 2002:a05:6122:d2a:b0:5ea:dbae:3cb1 with SMTP id 71dfb90a1353d-5ec232fd7e4mr3193914e0c.19.1793074181403;
        Mon, 26 Oct 2026 21:09:41 -0700 (PDT)
X-Received: by 2002:a05:6122:d2a:b0:5ea:dbae:3cb1 with SMTP id
 71dfb90a1353d-5ec232fd7e4mr3193894e0c.19.1793074180884; Mon, 26 Oct 2026
 21:09:40 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
In-Reply-To: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:09:29 +0800
X-Gm-Features: AclHuK9zQUYmMt2_uRNQKGHKLEw3Bs7CkPsj4KjP69u-e7zyINlKrBFyGote1T8
Message-ID: <CACbMrhr3imVV6nNLisD+gh=wLPn8ziw8wRL0UW6e-6by2RufFg@mail.gmail.com>
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX2y2E/LBb0B6X
 CKOQ4aIukAdLilV0SNG/mgyMqIeYCi+VTSjNWTEL9ml8Z7dhFTkARgp9/yTwB5y4FbYobuw9W4X
 odKf0s+wrsNHx388+lcF9GJbQYidWBrndgObc71MmEntOek1+1kKRAS3DygaQCRFFPG1JXh9l71
 eR6JJxoI170U2AvegLLG9N0FVHmLRkBBJwngcsRXXMj7n2TrnXUTSTY6Ixux2j+d5xOO+0Xa3+O
 J7nclpSnCJ7vY2oNJ+OTLt3BycHH7xufhclJnGHYflQPjYxW90/28yiHJEKxaSMzoCFthB0PuFa
 s/wy1xwP6INmvZW26xBolaQQ5XUckTLNnFqlFdnW3ETmyiAUHNyYXHbrIE/I3dj19LDWLad1gb1
 kBVwa2NZbVUT5KC7swtRYB5jLdfVOsKXtysjsAN7MdzIFoWEFElZzL1/m5mElX021lQx1v/JNtp
 fhHYzmLriKbbp3HgTIg==
X-Proofpoint-GUID: MWi7zUyQxwLp48vAD2yCxPl1FFF5Q_9o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX5UZDe45MFyYI
 I2NIM3ulbEGP7NW9TJ4JvLgirSu2rfkPVpHDQ0apuEYHQNmTzPDYDBPhZ/0vyrAkI15uO2fzxaV
 I3CSBAxRaf4Agms1kaf6WCVQHzHgw/U=
X-Proofpoint-ORIG-GUID: MWi7zUyQxwLp48vAD2yCxPl1FFF5Q_9o
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6ae02406 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VpRCVQi9ATEJuri8zQAA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270016

On 10/26/2026 11:55 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add the three Camera Control Interface (CCI) controllers present on the
>> Kaanapali SoC. Each controller provides two I2C hosts used for camera
>> sensor control, so define the controller nodes and their pinctrl states.
[...]>> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>>                          #interrupt-cells =3D <2>;
>>                          wakeup-parent =3D <&pdc>;
>>
>> +                       cci0_i2c0_default: cci0-i2c0-default-state {
>> +                               scl-pins {
>> +                                       pins =3D "gpio110";
>> +                                       function =3D "cci_i2c_scl";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins =3D "gpio109";
>> +                                       function =3D "cci_i2c_sda";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +                       };
>> +
>> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
>> +                               scl-pins {
>> +                                       pins =3D "gpio110";
>> +                                       function =3D "cci_i2c_scl";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins =3D "gpio109";
>> +                                       function =3D "cci_i2c_sda";
>> +                                       drive-strength =3D <2>;
>> +                                       bias-disable;
>> +                               };
>
> Why do we have a sleep state if it's identical to the default/active stat=
e?
> Do you want gpio with pull instead?
>

The sleep state is kept so that the CCI suspend path has an explicit
pinctrl state to select.

As discussed in the v19 thread, SDA and SCL have external pull-up
resistors on the board. Therefore, enabling the weak internal pulls is
unnecessary.

However, I agree that keeping an identical sleep state is redundant. I
will change the sleep state to GPIO function with bias disabled, while
the external pull-up resistors keep both lines high during suspend.

Link:
https://lore.kernel.org/all/d30d2b5b-0034-47f0-8e93-9abde4dad118@oss.qualco=
mm.com/

---
Best regards,
Hangxiang
