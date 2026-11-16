Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794811190;
	b=ps/s8y4WEcx+OUba9sUuRiGy+M+9OAgctaUSiXpv2kksR/rVbIEx2dPciyTucEZJ3YsJ
	 W7Z4Fp15vLwh1D4kG1Vr9TeNWCGkDJ94Gf0797JhI6IvamdDrhyCYmC4GSjJ2wTF5cMPg
	 jOpJj+OsYWGvj3gtYZbOiEZcbAmBs+JRtVIka74m/94QAAY79PzDUhhmNNeVAeVlD1Uvd
	 2oJ8bkkqPmjGpDT8TCeP/xSDlPBq2uJDnRYiZGy2U6XOAYAiqhgzwd3SOEd94DyVgR19W
	 FDxNoOfHxc4Z7fC484crr4+vFeRnSNF6XpTkLTss/ovL92IW9sCg+tJO9mT74hfYZMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
	b=0jqSebOw3zXjeAu6DEbBgiDHf9QhDTghXH3RuuEYV4LqkFBY0j1OZqM8IUcv2PB3YJIi
	 DBSmIimXk9ai/gkT67IYm4XxxC0Jf0WgJhm15wlUAHHtukTZn/QPhS6KrIDb4bN+l+Sig
	 INJBTf+oYc+bbxgfJbT7qcX2dEndoz/1xm9poa4aSnJfjKXapfFLwMrpemxr20EeBUQhE
	 gqZvgXKdTAtFb3GtzrassIwk0Fv3szu57WboBuTZ0X5Y6JX90gKCFsWZMeeq8Mn6pnKpS
	 gSg4zAZMdkySlBUcjJ/DddrzoVtVYNC0OBa0XXDk93Vo1cllcSDRQwKvI5kedEbuHCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KccI8a23;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X91ZcNno;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE783606A33B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE783606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KccI8a23;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X91ZcNno
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lq5c323198
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uwe1KYw1P29e1DCVb9MjyF+M
	XhbVXhW/CrTXu68G5dk=; b=KccI8a23szTMbu2QuoBOEIyxSw8xRhiQsWZt+YWM
	gJr6Q+7cDA0uZRq301gg1OcPsNktR35+u+olq64jhgCdcbhDhkUIM5q/1w3HSSzt
	mPN0wgGtpP7EvRPwgnpjAOcchvltQ5N9la0u+G4CBF6cb1eyAHkRX5gh5sZ2KbnC
	QUH75P9/8S+AXIv31PqwTDyQGYEVvAcasvcj68WpyMItV+kWSXiciVxGLg9h/ncE
	tat7c/WacjwGk+qYkFb+wyi+u3m/+q7o9V1yiaYpvYrhIsByvJtNKW1VvHe7hqic
	ViY+VwHU8wXZao42aj7krdea4owxpl6DVTuvXhZFMkn5hg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx58se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:39:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2ecff433dso2683666137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794811188; cv=none;
        d=google.com; s=arc-20260327;
        b=BBKutVkSnfvs4QuwvyjqNch15xvgn9F2CVbBEI6ZP9oYOIeYYCrXktAXStHC+qGLLy
         klIMLkl4lY7hGjrHFf14FpLxP0Z4ycQASwCbb5lApBqTzrg+RWeeW2OWUDHD1TEwH3Up
         vCa6pKWDuwLUHQqTizCI6vbXKLUwXCEHndP357LOun2kbPzxYigMRyZayrkB1qYEVYF1
         69zZgg5mXipa2Zx8+C7hQGTkLB6xDxQsJwzpbu5qyuYPXvaOXb5eVXteY397rdOtLoAn
         bGlgIX5dN90X92QZ4epvy80tqmUP3juaVjd0iSWcBRcb9+bU4FWqRlw5Qi87w9RYt7KB
         ZMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        fh=O7TubQzAtxbqJjPiQUNA86CiUly1Yo1dlBcmgquyvDE=;
        b=K3B78WGPkskl4ytGCjw/yTgjclYpOXsezaoDESpWltabGGyM02ZbUWKC3drG2PpBpV
         NAVwCQVhwLxrpprSI4LATldrzQcQ3YgTY3LjytfPqKWPQmko4LSne2IiQB1POeA0vC5O
         Fqq0DkgWuOjJWObOCe1g46PEbaAPA8iKnm4VYjG8kUrnUc8imNCtH4lhAJhE3LbX0J4m
         vqRfj0u5+c+jVyD5fGsx8rQM2qcJvkWmy/alRhcy8Ydt8AH1JYxBQaW1OmlYnHsv003J
         6C5rlIiwPpNdQpNHQuKIvdZIe+0xgfORhs2L4877WG18tPQJy4dpel8hAG/Z3pUOYV3A
         9TWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794811188; x=1795415988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        b=X91ZcNnoqmYRaR9fw5AcAwuOTqOGF6u/nl4tfg7dMwf3ZOTioiNhtxpCfRSeYxxyXY
         NnqzdlC9fN0gDzml5e3FYrBKura426jYCnkYrtAmiBb7mR9ImRgf5kvi1qcgaYSTsNkn
         Ac3wZ9A1tYBfTj1hOgM03MUlro94ojHr7FeYTXJYlGoaFaaVc3Sz9Obb35VS5y+DWv2S
         O6cG7xuEbwlQt06LD3X+mmcWP9/UVqT/NOiwX8X8futD/Gewr4fIQSDM0Q4BxcbZnBVy
         voE63Rev9JBkIvQ5sANjv9+baXxXj7ggjTZgG/8jfNAdqtYBRY+uv1exOms8JsZ1JW/+
         UL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811188; x=1795415988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        b=pRrgSkglmitFxBZuN3XqBY1JB1KeEDMjYMxJPMbLNKrrFdf0XejY9qDLPrz7iFjQIy
         7o1jimCE2KUt95pSAtz+OQ/h6/Og6fzuqMY/3hwWFB9nIa0DcBMR1rTB3fNjhBlIRwmD
         xltJk5OXywog3vrKeW7B/EJmj5HbAv/n+/U9hBYk9A1/Xme69Au/7Vm4Rr7abO1mgwDm
         gF28F5BmgRvGM7Wd0++ZT3Wul/FwMGH+oTfCANOtvSvstxz2qpDmFb4dCAmvS6I3CdGk
         2avtoAZptJ1omrb9AudJci2dzoCNV6SJjqeDjWbx+Sdi/0cHGPRsNP1yQqt1y863vPbV
         8xVw==
X-Forwarded-Encrypted: i=1; AL+hErF00VspPoPnRkfJcBrxeOa/zebVWnbVfz/k5K/twwzxyNgM6F7dl9CAJscydSLMQ34I8ZksS7TicEOGnm8v@vger.kernel.org
X-Gm-Message-State: APuU4Z+ffR7CT+B9/ZiZGrIJ2TZxC0j/LhDRxPKPv1uD/HQf8nwsOry+
	BZ/iUPnvs8ggxC8xww3+zGKRQk+5niJpgbmWrAMRBUbmK6ArMUZ8YK1uJT61PgWuqAZ3YbYmTRl
	SnO0o/TAv81ZwkKR37sZkWFJQQVLJO3kNvBuvE3PT2Je4GaorcgvRq5JxBpFnv51kz7+iTGTvcY
	ep6x185LhhDAS00dfv/M+DtKZd/ha2C+0tNGpiBKqYjmQ=
X-Gm-Gg: AYBFou0NFBOhLLMUa8nUde2EbA8CENW69RAvD1G7intGWupl6CjnY3CTXvQl983/ye8
	KCJzsKK94vA1zRRO8skdRHtUYv30zziewAaS9r8/acnU1+C9bQDbreIbZdPZyIyRA9lgB9iSg1i
	BYWRtWSxCwSDLAeWc3FSe7rdTkhDfnvLoUwbBZ1GVXgHA1HduEyjDP+MlZE+WzUEtMf1MfiXxjc
	Te6bSNeaKPxbgxmrQ==
X-Received: by 2002:a05:6102:c86:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d64d76c2d5mr3162548137.18.1794811187966;
        Sun, 15 Nov 2026 22:39:47 -0800 (PST)
X-Received: by 2002:a05:6102:c86:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d64d76c2d5mr3162538137.18.1794811187555; Sun, 15 Nov 2026
 22:39:47 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
 <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org> <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
In-Reply-To: <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:39:36 +0800
X-Gm-Features: Aa3M54oy1Hdi3jJI0vYcKhvRYWOd_gLd_nvmiZaADn1RpRApqiz9QprVKg54Urc
Message-ID: <CACbMrhqnjEhFzu+Y4OUoNVv-XhZce=cjsuFnUJNQD6FMN_ikRA@mail.gmail.com>
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID 980
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNiBTYWx0ZWRfXysjy5rVpPJdW
 eRqlykHOJw3ZR+YZXPxlWXnvE0TDdriKrFM6WP6sFn9pAQYwMT1QXTZiqYpFkO6amRHeXuuNML+
 W27as2no0e+uj5BzQs/F63DeTgzTQRoB8UHOzYpnfPMiDyPDd5uvMiyLbIH5MoB/1gMqpadP1Yv
 WWf+m8ZsQVDdLs56eAheGZNnBrGFdmR4OZaO8oySpLtkP5+ulYYcFHSBhRhyLHhs/TlscPeHL3T
 reQBnlDALEYjq/PK66c/Y6ehImubuojl/4VHKMuBPLHlIWDfOsRQWb0JO9oVtHHi1eGN5zA4sKW
 COZnrt0D0dY+DSZdZbpKY8hFkAk3as1jiUUq0KKs+nN9xEqgaXXFZ7xDRALT0zHrDz3U0ds3dS7
 GSGjyyXlz6OjK5LNNUnO9eSeRFEX2lSiNsnCakFjhct8w+pGUT5jFkulZuG5zMsRefpR61KSvS9
 y8wbEj6PIMkZt111+2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNiBTYWx0ZWRfXzvdnD2UC6OlW
 4KacI5u+fZBtez7WZdnW+FGoJPE/DNcRu5whtQo3uhMzZyYLqicfk/qXkROpuPJsWL9Yn118LrV
 aFO2SftFXixyGVwFuDYpfBav4/eisAs=
X-Proofpoint-ORIG-GUID: nB7p_ssG08K7trzFpBieZxP7SjZXFUfY
X-Proofpoint-GUID: nB7p_ssG08K7trzFpBieZxP7SjZXFUfY
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afaa534 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=f4uaJoA6WFbKVHIvzf4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160026

On 11/15/2026 8:16 PM, Bryan O'Donoghue wrote:
> On 15/11/2026 12:14, Bryan O'Donoghue wrote:
>> On 14/11/2026 11:29, Wenmeng Liu wrote:
>>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
>>> +                __csid_addr_update(csid, i);
>>> +                __csid_reg_update(csid, i);
>>> +            }
>>
>> Why does this run twice for the same index ?
>>
>> ---
>> bod
>
> "run CAMSS_INIT_BUF_COUNT" for the same index ?
>
> You don't increment a buffer index. How can this be logical ?
>
> ---
> bod
Hi Bryan, CAMSS_INIT_BUF_COUNT is used in vfe_enable_output_v2() to
queue buffer addresses into the AUP FIFO.

Based on the hardware documentation and our local testing, each AUP FIFO
write needs a corresponding address update to take effect. Therefore, we
issue __csid_addr_update() twice for the same port.

You're right about __csid_reg_update(). It only needs to be called once
after the loop. Will fix that in the next revision.

---
Best regards,
Hangxiang
