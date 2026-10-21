Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568254;
	b=wxXFufjhZ9arVlN5zGYRGP8rYP+GOukc2aBdtCHX+4E0lIsE/TyZf+jlxOZcnpZHRFRv
	 eOmw7hWunocyb2etWcOcsNVPPGKDBTZRwmCzUUHhqbmgwKmB0L2nBpnxp26OzTvLpmsa2
	 q/6oxWSAd0NmlXqYQI6sq1DjiDNGPUyWzLv3W2yKmTkCXJZSrZsf0dWsfjxznyGvcTxOv
	 1LBkdFg3cnB/AuQF7DGItZI/KtXmwP0JWYHODCSbwKtplJs2yVNUbrPtyShmZH+OdiBp0
	 OjjxRwdZ9+nNxwEnWB6ve1eM33yNdatDbLcHQHB8j17ogYJSB4Xs5YyvyQnvswf2a1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dE9Whcx7aYzSs1vHLM4QGyyjgm2vJotYCxRHkbjeZk=;
	b=ZCo5DAMLANjBvfrbo4w47Asy/8uIQ6TffZ14hzDJdMtx2jbtP5ksxRp0xbwk7c8bKF8q
	 QeOP9WNpyg5ki6TSyYxiFK3ezQ1ANK8qEVWrFC+xYqzZQjn4NrOhO2X6fVURWqwH5JvhO
	 FNGAbhbCsAAwLt8cxWUMQcpuYawEzsC9x5FN8Hc2a3zl3qkBS3ANrkV0kWIiaIIejBbsA
	 22+H5Ic0iCTIunr1jM9kGTPOYG7tIiqCbPZ3J4XjcnlO8+s/YlNK25nwTN1F/VoLSo0aA
	 /aZroK2hiWo0bkJ8WQAeEKiBwu1R4V2pPp6WJpg0KDqKj2xn/oQ2BVSFfznj+HhKbpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kzaLhfm4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUzjFWXy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72689606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72689606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kzaLhfm4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUzjFWXy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jAkA3711677
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dE9Whcx7aYzSs1vHLM4QGyyjgm2vJotYCxRHkbjeZk=; b=kzaLhfm4i53bj6Kp
	DMtUHdl/gYPYCPUTeDtr0fWXpRLyCdx0eXMdVY/fm+kfUmLD93QVRZjSk4WQIi8Y
	ilPRlGXimcFdi60pWyvDoBbHQYrpHLRzNhNGoZOEsRuu2ecZE9syMpBuyw9V87HD
	qgx/sEPAkJn+h2xP07Cwr0a7PDPbHsSceCXB22zrdd/baZG1utlraM+rSH2PJwJJ
	zFZadgV702MOvsP6EVH/h0hW36Y8I/D+KighNnQLO8eEOZwrZJKoqKp6SnBA9glK
	5fjtAd+eWps/j5MN8u4OsUlkR4LOTe9UQxXaKesy+/SxDxnEhdSAPaZ3I/O106xF
	UmTSyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v2mhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so13171685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568252; x=1793173052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dE9Whcx7aYzSs1vHLM4QGyyjgm2vJotYCxRHkbjeZk=;
        b=MUzjFWXyKg4SyJoakEMHHeujnoQu4FcpooiTPcKLsGt7T8G0x0PXIJ+ObJTHsdnWJQ
         GJsjrMe51NyE+42v3CLf4HSt7SPgRiQ88aKKR7kV+v/H/Q0dUa9fdxf/jgk1p+hOx0e7
         5n3R+YHB34McMqz2bwGMbBDPx8I5+CJDh/8oDERnkp1kkSHqC8n1LCOzkqoa7asFPziu
         V++icSLCMd/WMNpaWLjiFq8kJVme7SG23NGrI7yipcqktRPAcKUc7TVIWC6zY85yplJ7
         0D/EaCI0wKyYoiQBGZn0M33ukwjY9oMyXLsZQC4edFyCjdhcgnCy6+jxrEo0j1pVPnlM
         V8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568252; x=1793173052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dE9Whcx7aYzSs1vHLM4QGyyjgm2vJotYCxRHkbjeZk=;
        b=xuwvqZiQ6neKa2mTgO3jRfOYrIgVn8DfGJJ4Td1bV4HshNwHJpkG8kK5R1uOCJxwM/
         2Sa6sEpmyoRU30ZLxaWGcF96gvMnWVpgW30gJe/Tb819bAVSx3nQiU7cM1gXL4qS7K3y
         nTCotw9II0E1wZ1YUVhSYHOpC6uXVAJe62E1cdrApMzKUue8M+TVQACAKcJ0910dH0tU
         t+I6A8M17Jaj+6L/LpU/swjf2UTghfi+ul/Z5UshkShSP2zU1xfnz0Md4KmuDKp3SrRa
         3BjrDzqoUYeYiRcmbGASLnEySNCw7NFKkCImbuNNp35CBfXllxlGFSM1G0R/VW3yPEYf
         zI1A==
X-Gm-Message-State: AFq9FYLqC/Lr7drmgufK9LSfS0HHRd6q6OMVEWt3wrgy8tuFwZEEhMgz
	huW+I2HPfY1g5iir5jYnHOXoeTDLzCALbFCp2KMgndQ8AttWgZHm9zc5RwdLcS+NzUDuzWWKhiL
	CiMtpgNpfFX59/nebuIdYf1xukBLq5mxFSJOYDIqHtVObC7V/pxx8lI5wlIantZsBRZi3
X-Gm-Gg: AYBFou2QrBGHUKPrcsLMMPjf62lNKRhUA+h3EHRy7yV9VEKX7a0NW0bzm/qLhaISCnE
	WYh00yWgt/bTMlP8CRlPac2kN/Ky6o34ydZxhX1GgZ4oLNvNb39zH4KpiL/INM0l7Zspc8OzUyq
	cwZZzTPhYQPfknVq3HaYLUd79DV+ECLtl+OOzRztRc15dfyTp4RO+nBCDOvUgXoX/mDgqZDQ17Y
	YyxNl4GnlPSoK9DpNn5usZzSg/wke/E5nvxt3aC0rFFI4ScBrPgvRBLPmeKtIv3tdBueG/fWOth
	JaAUgw7l/8pWoyjDH/kan6PVfy5a3uhtn2DDXWZ7k9krHPOMAp2mqhKqIClWLKWwggydPrRZbQ9
	3UbqpI0uQcm7bCAeh+AlsYg==
X-Received: by 2002:a05:622a:513:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5369b1ba391mr24416561cf.0.1792568251750;
        Wed, 21 Oct 2026 00:37:31 -0700 (PDT)
X-Received: by 2002:a05:622a:513:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5369b1ba391mr24416281cf.0.1792568251334;
        Wed, 21 Oct 2026 00:37:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900686dsm45890566b.74.2026.10.21.00.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:37:30 -0700 (PDT)
Message-ID: <67b2a904-5281-4dba-8da7-7c070dbc9877@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:37:28 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: llcc-qcom: Use lowercase hex consistently
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
 <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX9XHGFvTIdTH4
 nxLDjl34QmcapVcEaxrX5Ph/nl8v+7uDfOHu5p8dkT6WQ3FDwN33lQs3HdfYUtI5gqhQYsvsWpO
 0uPu7ha6yL3tNOkf22JXcmYDAxYvZ70=
X-Proofpoint-ORIG-GUID: eOgzvfKbw3dqtNaI98RQsZcLj7qlDKhQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX6wbCj2vYkcVJ
 nFJR/GYNFSZPoGgOD06c0LzSlPzqHBjMy1S8EGT0GjoggnYNEtjECjpyZ5wnBPcyzVGR2kjYNP1
 wgVeQzSVECCfme9jHTAKY7EgGlUBg9lEyYFixwCKYpVTrKoS7qF2ydd+nB0BrkJgxhwGwDoMc3b
 HFbofxwx9mqFzd0Onjkc27PXN4KzC75SSQyGaZnb48rX336oRRQZPnUiLX/HOtmHxcs2jID66S+
 Qo7aEipTlzFJ78XIwtVImHSw98SA/dtEJQAe7J2yhh4pjDP2RMQuE+EOFNMkCh6OWt47ezbpjak
 aMLYi/zpwPaQjZhlcCkc/MO4LFaEaZmiY07WjF6m5MS549LnvACVff2K6oKtNEGOTKKB+I7jovt
 xvLW8JCE8vgg/NvAainSQfxx9/WAhQrRuJa9P9A8YTC/WTdq10LCcIBdiX2D5vaQUsAOTxvklqe
 SmU8IoOmBrP2Uj0yR+A==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad86bbc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qMsoyx-xFcVx60PzoVoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: eOgzvfKbw3dqtNaI98RQsZcLj7qlDKhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

On 10/20/26 6:54 PM, Kathiravan Thirumoorthy wrote:
> Convert the hex values in the Glymur and IPQ5424 configurations to
> lowercase so that they are consistent with the rest of the driver.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
