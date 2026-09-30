Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1514C10D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766309; cv=none; b=aRb/7bOvHuO4FCbQ5pmddcKbXkPQAjeyVzjD2MWRsidE968pdBWqYq2GYh9XbIzaEPQRtziqdD6oEXao6NX1PqOlY/P9V2EokKGmaU4bLPn42pDTs+9b4ql8rCao0Pv3pkHs1zxHo+r2T80VFbo7n/Eeo7tXyaTAwJDiC3kMMP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766309; c=relaxed/simple;
	bh=PknkWi6bFhwMmqL8I8ZmnWoNz4EVuxRbnexTR4caDrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aF9hOFrpolyC3sE5luVz2R9TlwQAt7bL453c8hdurjuFxYHrQGkeDPf6HXS0DidESG8ZOP0D6Ffhe/Jzzn9W+zdn+1Qdx8O5Nk9YdNpfT84lXt9AUb/+F4CaNIOpuq/MxeZecYM+141uPT9zmmGGXpNhbYOVLPDfNy9m9rwcaZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHeFITAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkFMj+wP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHeFITAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkFMj+wP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dL5K3082204
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=; b=dHeFITAhIHTObKce
	Xg7F+2RFwKge0dwaq72OL/lufzBzlUlWrTMVlUydLRi8Lb9/nyMcoPkW/RU6LhLd
	V4Gwl2v224CsOwTQxHejRXDbvzuPK/2mEw4C2Ni+/8RGBmsOP0TiHGzhEsGHWCot
	E0VyxGJ7xw5hpptjCWezroEa+xZ1qgVDvS+iaXU0WFcvVKP3kur41KuJ614KVZvZ
	XkjttkJOEPBSmgmKxuNsepYCZTIWN/DeWWCmGTLQfiHokMdzz3CeQsoSNwXr+3Cx
	KNSaBjjwXmetibIFcg46XBe6OcmRMk4qwRs4HU1xRczYr+1NybwpeCRCr8PYV2pN
	enSoyA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w1417ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:04:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a04d1cb2so1035406d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766296; x=1791371096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=;
        b=jkFMj+wPAuClE0i+btfCk+hasVTs6cUnOsTZJdEvu29+T3K/Pbm1Q7LQwHaiDFfpPA
         hXyPLcKtCwosKJQXuwrb1q4YNHBmj3SWmOLFiubrg2rK6i/ypaap0iPZJr2MXynjPewp
         SG0V+J5dI0BxCPHaQ9htEVgaaCo7obHJm7GwGMnjR6Gp5c6MEI/TgVJGbMJd4yLFonhg
         lEXIAzCxgA4+LW7JswqR/7xaLhEy/QJCHa24pPJWKqMx1uZT7ABt3V+3E/dJRjqHie3k
         BbpNDNPVRkUEwIgtSueCOq5DGuBEA2pQytceD0VEJV7K26TiGY3Ea2+Yn5VGKGuoZE4+
         eglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766296; x=1791371096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=;
        b=Lb2Te6RGGUcgBjqWr0Om1hooBEnZ0rtEZ038Nd7rEr87g0mbIVNvLxWwFYOqRdpunJ
         aVmRjzq6gJBCDWRc7Rve+9TXHMWfqR7i+5B6uU1dOa4xLrIBtHaYJUb/gGRpRYjrVBpF
         YOlHZXMoaxgJy9EfsXOpTQIJCQlO7zjFDxBmKnwsUkK9LlfTuATntqKZyb2OhQlpm8kY
         sJ1/Gyo0P7Iy+6KCUiL1zmcPXD2pfE5VH1ucVFgW0xSJ1vXytNavU6TkHkF+BezCDEEm
         yUouygXKxAE/EgC62jScwB4kWKKeOPFEru/ZtpdGuT1nDNoRNyVDzzVUWqihuS2g6B0a
         XUSQ==
X-Gm-Message-State: AFuF++mTuKDd0DjbP4a3HzlQz9JY4+lmMVU8w7otvj0dUR+Gpsah2dyE
	2JVhvLXmFZoIkXC71SRh9Q+Xr1J0BGqAyr38AMjBmLWsygYdeb/SnG50xaOYfYcc4MRr7cMs0zu
	k73+eIYPSHvkQRGMm/kKj1Rc2/BpcNuTAvZEwXCoPqJ9PA19hkR2jrRhzayIU7CKH5KNC
X-Gm-Gg: AYBFou1hRg1w7T9nwBd/gz0TdQsuVR7zj8AkiZ7Vs7A8Dy93hscwf2eJ7zng9XN0Ahp
	XBD0NRgNJ5pzv/dAv1UPdQF45kxZuyr7Gwvq1xOvqECLrju3QewLKu7Sk2XO3T3nUaVxHl1CCwD
	frQwox2krc5lx/LmIluZ/j96VlC3uYa6+8ogDzqAyBwIDYF9LW00dU6WDnjutmF0D0EF1iumwzn
	iz39COS8JCqjTFAQ7ET1aDQJdBPehrY8IKQYrfg+rvLRu5BFhlncwk8f8Y8yOkPPdZh3u1LYDpL
	og9Xz0WILx0vUBmCVOZOCi/uoHgiN1juAhTUAoF0KVN3zf3oYj24GmnLHjd+mEkkt5yZ3tzFqtP
	NxxEkkiWbf8jl77xdR8GM9Q==
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr146823585a.6.1790766296348;
        Wed, 30 Sep 2026 04:04:56 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr146815785a.6.1790766295693;
        Wed, 30 Sep 2026 04:04:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15395755sm604092a12.11.2026.09.30.04.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:04:54 -0700 (PDT)
Message-ID: <87ec94fa-d692-42ef-bc80-9ca485312c88@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:04:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/15] arm64: dts: qcom: hawi-mtp: Enable camera
 subsystem for Hawi MTP
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX2P7UGjBM43yO
 yaofbtJGG+XUJLIFpKLF64mH6PkJ4jDRz80AVc0HvS22JX2QztLT6RJkmPoBcpYUeCHAZoXCk8Z
 CRZbJ2y7vadwPbV+m7ZG1ljNxDduNw0=
X-Proofpoint-GUID: vwVXVy_5U4c7qFu2KKcRZT-7uLUzEd4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX/5XCBfqOBKSK
 4cEYVIkFlJ4UcbzpbX5+7QuaAYW48BLbcvg0VGT7Euzfx/PPZIs8molEArTWdMiOw7IEn4q6IRg
 krLCfxDMRgszWUJjDjM4X236nMGghMtNMHJbxAn3OywCsZf5qN6lcHK/9VvMlOXzcNvsD2jZKp5
 iptKmHxVzdJ1TiXPWzFMOF+CTD8La51gHntXQdG5aT3nlhSNTgzjpCH/4VMpfSQiI0ub25QOaQr
 XDB7J7hlyggqPfPprF1QlOoQha3J90WI7RvAuS1hNDfsKcEetOx7L92AO5t8uAMW+DPBOOpYXob
 h3pqRJ5LntaYYZizNbg0bcr/bEPDsD282gsZNvOgQPuvrn2ao0zceMbqZcRgp6eAFwk5B4tUoAL
 aSj/tMAhSQnlcT8B/rKmaIxpE1WJy3pXA0odrww8GYyxK/oLd+rOfIpDijp2ldvonk/nBd8H/3N
 tsRak67DzfDXQkPHaGQ==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcecd9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=APqY-0NjVA1trQotmb0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: vwVXVy_5U4c7qFu2KKcRZT-7uLUzEd4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300043

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Enable the camera subsystem on the Hawi MTP along with the S5KJN5 sensor
> connected to CSIPHY2 through I2C0 CCI1. Add the camera master clock and
> sensor reset pin states on the TLMM GPIOs.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
