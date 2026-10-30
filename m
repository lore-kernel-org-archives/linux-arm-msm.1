Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368747;
	b=2Eel/7kvytxVmY73F9HlC6t0edjLgU6ywg3+9x8e+9II0AiZKuoqgl++Vbwqr23SthS7
	 Ush98TBL2ZvkF4oPXKouNsOaWdGL/SDC3qTfbr0iKtMhl59rgCzP4U7Kd8Z+23zb8+WqS
	 KCeDE+I4AHJMEGCix2EtXQlSJirvF00MXG0z3u/xDxcrEG7n4mKUgIEYbeP9mP87AOG/9
	 keY/EthtUs8hk4KFRaW8ihy3+KvhyFtEhi7axcTZ/z600VsnL+BbUd7JGndYwFsvUKoBm
	 o8qsM1WNPWYIpvUjl7RSrqiw+ht5j1fxzQ4dmz9vUupEri1+LTFcqt/GGa0jtgX3tuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LTlv+L2o+ahLzJI1GsFG74mV78r8zqw3baE9fGpkQVY=;
	b=BuL38Vpec7+XjIbiDbkIQqiG2prZ3HECeOiBtTJk5fBRR9+WHYw5snp+PlsFsItqapNd
	 f1qZXhJD5X6b9/fLobfo7GZnGxxNeLa3IVNCVum7wNYaeh0Br7uQkzaXujcJYHBp3XqNf
	 ThptlP0BBRcRkQIHhOFSUu21imPCFVGojvOaCLMHQxhmgt/dDlJcz9C80MedfUjRfPPaO
	 3a11K6RV9x5OLfW9ApmAcumnWzY85wCSam0aBMy0KijoFBU0eibjwnnrAb8VDtXagEVwU
	 uSHRblqNQUMf63fdBvVHQmP3sVMD+8iWBEFeF2H/Vg4PIkYsGsxeThJdqHYDl1E3Ndw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HlDwZ3KO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FncZsuYW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA048606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA048606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HlDwZ3KO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FncZsuYW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnCjP3468747
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTlv+L2o+ahLzJI1GsFG74mV78r8zqw3baE9fGpkQVY=; b=HlDwZ3KOkdTPzGNO
	jok7HtwaaL/VhEXI9VX8+t7EhGByaWgNGAuCqjl+1NxLxFDkuFO8J21qU2p9IrMW
	8fhX5vy2CjE7hT6y4AJ5VEKcgBNA4RDbOfBB9jblPgbxke38E1l+PQUMNKMASf1w
	Fl42YIk72iNoDVOGX96ktdJYeE5EN2dGgDQNkYNzenOeFq/fQ6SBW5kkNJsI1Wuv
	DibsI6lI4aL7QYdIeKqrYEIxVF8KVBnz+JpR0n0nBlUfIXBs5WdNTVWr7T7XkS3Q
	UFFLOAkmVnPPLR4/ruKUX6OPqfC+aANWOGUI9vh32PZ1rqDPX8bHIwlOoOZFibk1
	r2LUhA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkamr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:59:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0592d4539so1005068b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368744; x=1793973544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTlv+L2o+ahLzJI1GsFG74mV78r8zqw3baE9fGpkQVY=;
        b=FncZsuYWmaEcChOpkMxfqC88o8kfaTx+Eng5k/s/DvDJJWPOkBLO+1J5Z7HnnV5yDH
         Rz0dkZZN1uzmeEbVaP5cbyLwYrcQrOT3obqxpk8xYjWbkXR72bhs1ML2S6Oj9ImWl3By
         V/JpChRYPTOjWGgDu4noF05akraS4YoaawZcWFwzCpMrcdBORw19vWoCkQBc9WqjAqRE
         iXQw2Mdzt6U2EE3EGt1pRbtq9tmZmhFW3Rx86ccWgPldlBn4bn+4JmlCm4JhhiAbs6ft
         K7HUN/tgMztzB6CxCUPDBFW3I583NwEBcX5k2WktHixu17KsSNJrni6J2/Ctzt3HfkSD
         O62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368744; x=1793973544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTlv+L2o+ahLzJI1GsFG74mV78r8zqw3baE9fGpkQVY=;
        b=azcrHjWcdJkkxwqsmzNdR44L2fNOwkgoByazUIGgCMxGw17fFhxHp7LFe01YBEAdsN
         Gy1jcR/Kn+s3SN1M4LHMhUwzaYMuIKs3tFsAw71knZlAjnJfhOoRLVnz/oa1wICjcJdm
         CACAV0egSwZsARIsP0VOWLY6F+6ppin1USP1jIbo5G1wT8j46leyPoy/YaHPJMdS3O1H
         m1iVqp3CDpX71KkKfxd6juFdaSdW2+wXf7JoUoUNpz8co2pnk9qsR1YzjtcqOaPr1pME
         Qd895SHyrF3clfsJmMnR/5spmY//KhiFD0Rkm78+SQiumZwXSSdI2S9SlAEDpWNRS/ah
         WC8A==
X-Gm-Message-State: AFq9FYIqi9QhQd7m7P2w2Y01p7ROoMWpq6mooiGj9UoxtQgFOY1DZ3Xy
	+E1aFhHni4S28GcN7gXJnq9FADvEac06iTf/mMbibhizrpGma3s2J/Nj8cYL9Ga9W9d6eGqxCvb
	pJ+6iqzaYk/DM2mc243J3lQTYWMufo07hmLz0eSd9yVpMzowxetyGQ/DD24bcrG+jjm3t
X-Gm-Gg: AYBFou1m0nbzXvjIlB+qhWyv2ASM9P6+ruE/v6qIWIn3gnWr0U+pRGxOvBF/rVDW0K9
	8A37OXpdZx/PmYTSmSUBzQ+SJWQKh+CMHGX/mpODnBro0Zc11PV65Gu0N8V1CsmEJUAJN9QqbWJ
	JFPDtsNEhI3DA++bskwmHBYkxUbsX/c4JGKwbXpMOYWdAv9utLycvxRyeDB0kpHyebIKamv3eJX
	olSy49NQvbTx6QwRLlL3QFJWZ5xk3L/uUJ6cDb+mxQsCAOge9f26+G5R/3HpDYozMBQiuKvUP7n
	BEXiIdxlMv2CH7N6doO5zX4sV0xeNpfi1GU4FTPFPrbyLgQRr450qu9N5iT6Bkt/uSot+J2E8d5
	Evj+GA3k4nZVZwpxm7QkLEpYNBx9w6EVV0sCm+bVyylFcQdXCLQRApttw+aXEzIndmpw3QnznBh
	GBQ3c=
X-Received: by 2002:a05:6a00:1783:b0:89e:37b1:b81e with SMTP id d2e1a72fcca58-8a9bea5c399mr2307946b3a.31.1793368744439;
        Fri, 30 Oct 2026 06:59:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1783:b0:89e:37b1:b81e with SMTP id d2e1a72fcca58-8a9bea5c399mr2307921b3a.31.1793368743970;
        Fri, 30 Oct 2026 06:59:03 -0700 (PDT)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad7801a53sm12882b3a.2.2026.10.30.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:59:03 -0700 (PDT)
Message-ID: <53640a9c-395f-4faf-bbac-20c47013cec4@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 19:28:57 +0530
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
Subject: Re: [PATCH] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-qspi_dt_binding-v1-1-5249111cf870@oss.qualcomm.com>
 <f71369ca-5963-41c7-9103-dd39a7369e38@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <f71369ca-5963-41c7-9103-dd39a7369e38@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MkTKzmfPz_Yxs_1n667fC2rfPwqTJR3T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX1wOI0H04TBJj
 w47m3NwWGoyCDmN1bW0MPjcm/2HiCDQqFKNLheOjkfqMx8XN8R00CssDE1raGGzvW9/pTWmucRn
 L3i155trO50gIVbuugBqFB3zHeWYoIQ=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4a2a9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=O4LJdId_ek-TerMgtbYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: MkTKzmfPz_Yxs_1n667fC2rfPwqTJR3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX2PZWRgsdIAas
 zExYAnKeMltR9pEQ9wm0KzuIFhQjRgVkWsmG9gvrO5VyAVoqHlhh2dTDxFB6gwG5PLWBtaxlYUV
 lCWAubCAxHBUCHwkjUdrtiunk3Fw5ZEBo1HVP1SBGiPKYt8kTxIFkJxgaBl+w8ivCb1zeggajcE
 YJJyLi3AXpNgv1wBZgPIFPovSF5hfKAMRo+NCFwi8DvI4HBSKaiyydMGoesC5xPpaqDHEh7/Gvv
 xbcqCqfYiwEV3LgOda9lwzET5ulqj5dcivk/vAWi61VQy2Mj+7beVq5zpBHvQaLkfXeppRLaBuH
 razPiIu+Zcr4LjRCfrSjWzasN8EsQiYk8apOTPqGdg68OyCT1Gc1ncVRwvRthFVVS4ULjrp13A0
 BtW0AtmvhBlzvyijaA8k+9NtF9f9TsMaTyUqFOK3R/eTMha/0nYAMnY1bbk0YVD7BFwq7F1lDDL
 ZhMY1a+UqgrBaKHqcjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054



On 10/30/2026 7:06 PM, Krzysztof Kozlowski wrote:
> On 30/10/2026 14:30, Jyothi Kumar Seerapu wrote:
>> Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
>> instances configured for QSPI operation.
>>
>> The compatible also allows the driver to select the appropriate protocol
>> firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
>> distinguishing between SPI and QSPI firmware.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> Where is any user of this? You speak about driver, but there is no driver.
> 
Thanks for the review. This patch only adds the QSPI binding change. The 
corresponding driver changes to add QSPI support will be submitted in an 
upcoming separate patch.
  > Best regards,
> Krzysztof

