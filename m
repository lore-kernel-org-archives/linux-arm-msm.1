Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109788;
	b=RrL+X+YZIixNNHBdYluAEDPsUOiMvJspnaT4w8vVWsx1HMzzUyfUSxB2LSo1k7nS6zDy
	 vlZjDCPVu3af+KmGdmEKSUOIVyfbHhGakQxIs2sA4EPcy96rAByxyVmiTKBEVlQkWQZO1
	 alnZX4dD14CSgsRzrIWkCsJR8JTJqx50i45IC7jQ3LvHVpCL+60haooOZDRCeqFPWm/g2
	 hyrnyOCz0gaIyFr4CjcUj10IQVzxgG+bBG9NVkI1lp/Klr8oGbzDK4lZk7ZRK6eJleQ1y
	 VSEk6obxE5zsF831sDzDwBdX9l0N0eWye8j1vcKQde/G51moMyrb5cQj5n5K1KGn9iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
	b=orLD0PePByRwHkOy8U7gkbAFvcLXOdL77QTI4eD6aQnLNPhU98KLauYevnTbwExEvkhK
	 +N3bYmpQpho6zpHVqGbEN/ySTJkVuQ8Oo2mQwBLD57xviZWWN6Wn0khLc3SaSWtzj+3Pz
	 Fm3arfwxgpyt8VnPo/3+WPOtsyEkKyFg2OBwS/GJ4o2gewt2j/wYkcmd/QRZbQ2/1AAO0
	 zXXlJP3t640btyfVp/8+/rbzW3LMEkWwVs5hCJx1bEoNjN9Fv6PVH5uHrskmYa9/3b5hJ
	 IAoZhKecFUCXxQ78GbSWwwgIug71Ap+nG6MTzmuU6Ypn2ONOSSATuSTu1V6gElKqwGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8ewLFbq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0Qy6g1h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B71A606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B71A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8ewLFbq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0Qy6g1h
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo0Dq2344166
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=; b=a8ewLFbqdXfjKUjK
	MMA/shdVyvemvXTbn0l+T819XaIhFdb2FIu1ugEAL94GzrVa4GtSxzBND4Mzb5NE
	unrLCM3ZBBsKzgIstFTRN01z28yAjZhkqV1FPFDO1TynSTxQVO4sVvEHKYMDiWm9
	tNpyQx3VQnqF4Ig6ObCEbsY0kYgEmWVur4coSOOrTeA4Z+l5DrjUIBkEAGsa/jYH
	9VZE8yxR/FvTC5Of70GTzWAHLD4Fg6kkg0b29MszjADf6/PlVV7JnozpzMbMwGc/
	jz5HvW54sQuc5Mk857WNGmwAW1Ms9SuX+UfLr8kMY/gdEJkCtrsX4W+CV+vwalsf
	xl+nRQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq697dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:03:06 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabe7151daso103918e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109786; x=1793714586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
        b=c0Qy6g1hrRqs7LvbE2jc4IfjRixz1XJdIl0rWSiNvrH2wRBT+xw+AgHZf79bd6LWI1
         NT1q1l7u/kJyI34KlbY9p5p3qcCRxhu0iaQB+qCIslg4MW3E5I/TLOoIKT9sPzn/3deo
         mgI2S+i1dRZ/sWjfV2q64Aq6Ghd415ECYSrr6WApiAyNxHEpcLcBlvOT6+0Mn9mmrfNa
         oW2GwePaXl9sr5lenmssx1GJkRBz8VJjaj/KEHVtoXVZVWM4LBVxYKuLw/jVlpgSDg/m
         EfuO2WVYKTCdrCMHKLlr3ioWPK9fTo5WO4SJQuys3dUo9WHoVHes2wHZtAMqtm3Qm855
         qt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109786; x=1793714586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
        b=v+kc0WGsTdXFuguwAg4ayfLDzWaxsMH17clVvXkZLQtLJshtT64vfB81AndYQPe+jk
         737YwS6yNwVPMba53bLNZsItS2ihLjH1I3vHGtpM91+oxq7Csm83OEFUVDMh0FEHVagp
         VzeWtn/cluOoGgXDjNLQSE3/T1Ip1Q+WNTzopQuitkw/I4ZHBgz7dSbdq3DDL69CrVpi
         /zq8jH7RrdvPyzZjFFLioNAjSOuBbKUxvh1tNdQjszsenir7ibwgbXcNB32pHhw1dCEc
         r1mdpt/gf4ShVlOMBdgYeELgruarMc3nYHHcKuUiIp3s4T6UkrmyXaXiMZ9WjsNfwWCx
         rdhg==
X-Forwarded-Encrypted: i=1; AKwUvBzlXUBxhZgievNTvXnMhj3oIbtbUnI+O+MEhvwOuWRcXS0PU/9TZyMuWGe1NMOVdHY2J0RSk/uKPSpg7Z0U@vger.kernel.org
X-Gm-Message-State: AFq9FYLuC0LeQV0PcwAfBROJXDFVp4QUacqRSuQIYy+EckI73n/eS1Xs
	YvNx9iqa35UPEGNfhCKbZnUmGmypuIwEFJ8yoH+ps1DUX3Jd6BIo++GiZqSh9bQ53xHXI+aveZ5
	RKKMLcJV4y+g3d4L9n6ClCBZm6KvCHL5eJ11X0cu7cv2XyMr3GJpBxlEZ1szQtBhEllwx
X-Gm-Gg: AYBFou270BpYgaVVELwq78mEl3O46FROJ2LF2X9VWTv5/fyk7vJexIJLYfi3TXJPD9d
	ho2Za+Re0Qz942PmtMgxj3P2v1XVDUa8v6LB2p0bOoIh5vi4INlAMpmSPJL8DZ9hQi/rnbXpkAE
	o6Edw9YhzReSWEtXEVvFcGdr8tiTzzLzn1G3tS9lNXPTtSa6PbVbDGcQ29W/GVCDqiNIxCbK6I2
	At3PmXr+wAc7Qa5R5La6AdAGe4fdsfPObz5tLPBg+TRMGNG9PutsBbuUpd2EoY3WIPeJm0ZfV15
	Fq1wetp2Jb0JmYauoaRSe2zWYg2rTY4TjYHOILzhgUXOZnoGUSO2CtzzT9eT4Akyb0mjXOpsktV
	rg5BEMd0=
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ec230af32bmr3420261e0c.1.1793109785115;
        Tue, 27 Oct 2026 07:03:05 -0700 (PDT)
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ec230af32bmr3420220e0c.1.1793109784529;
        Tue, 27 Oct 2026 07:03:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fbe6sm459999666b.10.2026.10.27.07.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:03:03 -0700 (PDT)
Message-ID: <1ae7cffd-f39e-415b-b2f5-ed3179284d6e@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:03:00 +0100
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
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
 <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
 <auCsCPL7gK2lIR5q@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <auCsCPL7gK2lIR5q@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0af1a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=DwHBtBTWuPJZlIKgACQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: lfK2uU2csmJhFb3hMSF3Wfd-ukAECoQ2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfXy2jGtLuq+CgR
 uv4b25ej9r5IMBDApaLVemhJ5/mvKUqux1xXJjhe2jssSa2FzvLETmbabV3CfsuAZydrG6GGvaz
 IS5pbNp88xJ7rysdH04SVJnQKlf1C4s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX6/Gi54MIVlxa
 52Pb4E+lVxqk3jvDQy04811NCgEyoF/uitQTtkNAdjXjcQ8kTBLX+cWeHktpZOgua69Xb8IuXFA
 c2K/I0dzh+BCRrJonjhVU36FVPmIDy5x9pO/G0i5O062UVtbTX/jCcmkKO1hoO5V9NG1Xw5H1hM
 u6pVvbE5M33BnH3yudlis2JGg5WB7MysNcoibLLNqQAdIbA/2tOebSXBOOaNsdui2STwiWkramC
 JWF8qmekWV3dZrCZvCBTKuhZnkbY/8xlxr0tNisgKG6Nnry6w8yWRzUllRA4EBVCt59Icd1u09N
 uj2ajOj0nE1rjHBJsiggFichpP7ksZ6Q+7bH+br1795hd9Gcs7ezVpT9TNbYgHnwK8FcXNOtPEw
 l9Vq1x080x3helE6GuBgLGUWt6uais3Qv5a0vkH/G7JVpCPA5UAF2l19E8h4CnP0XqSo9YZp+Me
 Qcsvve+Fm8YXLT1gfsA==
X-Proofpoint-ORIG-GUID: lfK2uU2csmJhFb3hMSF3Wfd-ukAECoQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270055

On 10/27/26 2:50 PM, Richard Acayan wrote:
> On Tue, Oct 20, 2026 at 12:37:36AM +0300, Dmitry Baryshkov wrote:
>> On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
>>> The Audio DSP (Digital Signal Processor) is responsible for audio and
>>> sensors on SDM670. Add this, along with the SMP2P nodes used to
>>> communicate with it.
>>>
>>> The sleep state is included to prevent the following crash:
>>>
>>>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
>>>
>>> Otherwise, it is unused.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>>>  1 file changed, 168 insertions(+)
>>>
>>> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>>>  			#freq-domain-cells = <1>;
>>>  		};
>>>  
>>> +		adsp_pas: remoteproc@62400000 {
>>> +			compatible = "qcom,sdm670-adsp-pas";
>>
>> Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
>> fallback here? Then you can drop a driver part.
> 
> Actually, looking at downstream, this should use the LCX power domain.
> Can power domains be omitted like on SDM845, or is LCX important enough?

It's used for "proxy voting" - i.e. the OS turns on the power so
that the ADSP can boot and set up its own voting (through a direct
interface to RPMH on its side), and then the OS drops its votes again

Konrad
