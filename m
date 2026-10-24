Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830006;
	b=fmw9WXhxkJJlBfthYSttf97iKLITFmIlcubwIgZJYeYs/gzYDTrncen2PnS3T8lJYMlE
	 OZsiiN/4YIbXDYdVCLa+tiwnphI9yK3KJ+vB1GUjhxBTca/b8HebXU6Sn+bid4Pp/GX8B
	 uzUrM5vPeXPYNcyzrc2Fve+3M5sZ8WfhY6zFFLZYCfcch0z7Xwh8V+BieugZaKdA19z56
	 IxsHoQeT5UTZITiykUyUApUDbrcJ/794v75VZF/L7EPhU85Sv39fChjn+SKz3FLt7YLLd
	 JSMlK9NvOV40yR6JWqbelqi9dXfb2qMoHuiHUKrgOBdOyWih5yCbFr6NckvblBWArzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
	b=0OQCkFDWFHtj8kwq3TApaESl2bsd2qMHSOhT+cmtROJ7xdAIZhB23P34V1MNSASk92Zn
	 Q2d96vOM85ziBMvzj5qOA+E1FiaBF1olgY/0On0qrcp8SVL/919WnK7U5bcgHvx1iX7k9
	 DQYTYv2SljMqRO77lqQWM6bHcR1pM6811Rd2cDrqJbnTpj5yUUTKrhGKOu1QtiFHm1BNn
	 h9XGLhWicwT7oLlW2xwXh4x5evURPOwu46BQ7MGmpePbTeyHV87RarOj7jXGJQbEPzX5w
	 HINEfbQuKct73PNnSrJ9hnYybrut8MQW/PJJs8EJEF0DbNQxBKGX34YFCNLznGJ6gHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCewLPDk;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EXcExY+/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35E8606A323
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35E8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCewLPDk;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXcExY+/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O3PlVS467874
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GWHL9All+sd
	wJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=; b=FCewLPDkOJ+qp3ajXIb/IX0SDcQ
	lhDmjdenesdG9rV7Nt9bmTlIPeW1fBLjCzwIESJAsVpVV0KpaHTjD3uIWy3DMwAW
	HL8PiuGTu9+AAKxbzcnSWUfyixJGn+UgT9ZQzMJSl+rqayzw+jFcQe3Vhap4bUMG
	gp39vo63t5Hce9ZXPdhVMdRLr2Pa5jLFq+ipKJVeVsSm6KPfLUKb8lXzd+dCMSzB
	A8kSXighHmEnzEln/dytbrDSstjfkCekhHzeiooM2lVl9fHA0AfDYEN1pqyqUD5+
	6S45cxzoiP+De70Mq3msDsykwsr1xf5RFwYbRXKy8OFzFBGv2AI5K3D5BFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruggr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so303538885a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830004; x=1793434804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
        b=EXcExY+/blJIMDdGAcamkDdxUcHZ8QW47OS5qnc5nWFj53OVICLCGQN9QE7tflVJsW
         oGD/kNaLGOLEeY+ZNA2CzwpMO7LRGqVNcKCZt8hMS8+c+joDx3n6Qc9L4G7/dkExzRCF
         nBi3Sjp4G/oADUqJO6lzYDTi5gtFvumAFa+s21P6QYL+O93DCaN0japyg/HU1gspjPNX
         EsRCwztZCTZHcZ2YWUlWKYmAJ0WJj/HhMcSjMNZcIX414jvIEf9jauOXNR2hlCtaFJId
         h/2QxFPYl/NtEmjhuRrxU7oDYX4R++aMApKxmIbQyE6ZPL1yIVTcI2/jDUB0aBDdY4vb
         ez4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830004; x=1793434804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
        b=rSxbJtdSKWIXHefJph27Eg15cLq3quNtOJagoiTxu2h9cNjsV1FmEUiVfl9lgU9o2c
         SubD/NwxjTVkIquTnoXtGwJ/0S6Jj7nz1GTY1VSUBy9T36y/UHdSJxfS+4Q2vSP9l7Bc
         IgbKO7SIF3qtYI4pqCOfK2E1G1lg5oypV5X4gR+0U2DIGyWJ4GTI19IyRp1yaZbFkH2r
         EucT4LiuySj0iJFlgOFBQebJLHmqdxcdFIgfBq3BgNZZfcNoliFNRufNUVuA6Lbp9sQf
         /ySIBBYCQgvQ2ud5ot1SlX5CbfXDi4CBPU+e0z4QnALVS8+YFkEmONBGmrhsrQCUJfbV
         kpww==
X-Forwarded-Encrypted: i=1; AKwUvBxk0UdZg7lgOjM4QE637trszWpCTFcIgIey0wsEwcQnIs1RCy6RtKuNkV5r4U+O1HZMUFnEuh01wI1wPbtE@vger.kernel.org
X-Gm-Message-State: AFq9FYLZBA6GMotgLfwHiOXo16qcZcOzE3p7k3ZOechDYxiPS9RIK+Rj
	ewsK/KeP1oMvMGOV63hEgv13JZByhFl0zFd/beTIMdC/8qbu5r90H+Et4P5oLFJxq1FE4xb4vjk
	st9dQDZzGfYHFpeGt126u2LtWiMSGU/K2Q3BniUDS6sUm14gm6v1y+rsLNaNNFYu7gFNn
X-Gm-Gg: AYBFou1SD+pQcfJoHzV2ukONO76P7N3rhz4PI7uHvFdyngBJNCDpFDPw0hqnreSxCoF
	hMrb8W9tTv82LESjz8XHrkUvO7hyREwp0lVDMoGgoaK1ppJjifm347mLVAaGoHGRgfNsVjh+wAR
	9CqHjIYJIpdINnrKh0uvA69ebMpTyVE9Sq9Q5LwYUWZTxDR5Mncn8cGsHGQ/jakx72WgmQm8TXD
	XeG3uGSJB7jpZI8fH90KlC2MaByXDk+JyaJRf24YoYH00+eCe7zu1dUuiA5JUzUSvj9HJEDcGHp
	uBG9IZNHuWz9FRxeXch9wnGW9mAfoxthgWe7ZBxEgGV+4cRrgJZGSXDvr0oYzBFQZ2Gm7dOO9qh
	tUUdjZPsHdT4/Aju5VmUEovrA
X-Received: by 2002:a05:620a:288e:b0:93e:618f:8127 with SMTP id af79cd13be357-940ef91e2eemr166869585a.8.1792830004353;
        Sat, 24 Oct 2026 01:20:04 -0700 (PDT)
X-Received: by 2002:a05:620a:288e:b0:93e:618f:8127 with SMTP id af79cd13be357-940ef91e2eemr166867685a.8.1792830003898;
        Sat, 24 Oct 2026 01:20:03 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Sat, 24 Oct 2026 11:19:58 +0300
Message-Id: <20261024081959.2887288-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com> <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX+5b1HoeUv12k
 RCpa6EH9vCEaIuZb6tLxOKPo19jTHG0xxCDspTCLbbKVfr35zhNOvtNCdZmZcr/hRKIl8rGPFxT
 j6rDwdvwq7A98STRoacvTdX42Le4qMOzku4//dbzUKt+gpySTSIuWBl8F8RE9LZmPP1Zwr2GPMy
 WeoM3E7etbdHezMjr6fui6XMo8PdRGW3zhmogh7k+et6rX+9fA34d26uYrg+vLFfPhB+pYiYNzi
 sJd3Bu0awxmso2RBVu+yWYBHCu/i7QJMtjDyZFZjTf1OWCsw+sAy+/7akci3VeCyssqRS03jxgR
 nZkspz2J+WcoX/8elCVFUJAW5vayQxTQsUmefMuGbxUQVVjANZg/WjT4EAsh6STN7kZy4eoqMbC
 Hds2QaiSDPfO/gmBtyMWTQPf3VoArkQ176+rfiKqSTdd125maDK6iSO8XMp5l70i7fN/6blwDCR
 naFoy+Iwg+ynmDsjx7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX21mi7tlfitxR
 rlBoNSzyTTokFrKhb8/7+EODfIDixHQHixOWUvO1RglxA0Hb6bBOLERnqwLRoncIdktWEvU1e8X
 IF0uDpeVDOYbjGrozmW4ynYHLv/pp2Y=
X-Proofpoint-ORIG-GUID: 89JbxPnbcYeKEBcJduKQrQzlRoj8To5K
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adc6a34 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=GIHIbdnDCuNUcvcnLtgA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 89JbxPnbcYeKEBcJduKQrQzlRoj8To5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240033

On 23/10/2026 22:32, Bryan O'Donoghue wrote:
> This sounds like it needs a Fixes: tag

Yes, I will add it in v2:

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")

Regards,
Atanas
