Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422F435502
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460533; cv=none; b=kl0hkU4ehjTuDHFOw0dHoQ4Nryxf8m5viywClDE5b7pU3VkHoei087RftuoxCs5d2+ps7u1O+bCjAkUpB53trow9um+J4x7hWtG8zThqSzuUATtIhSo1mhWLYzK/RI7vITkDoHuMqaeR7xQhNyC+HGx8E5LauWsZPVcYyEpUGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460533; c=relaxed/simple;
	bh=ceEvOrf5v3Z9+vRptPfuj9AfIT5gVhdIWPHKmGd2hmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONoNk6SmZuYtCql24CF1Wlv86ZR5MuuqcUjdDIPKA2jJQIUmREafFuGrljr4I8RJdHtpS5RLmwmEYJclhf0sDr4x3JeQuYakiNz36rw8MPxKZthcrewbptSnPtUdsx1Dic7sSEnLz3+/YLkdHBKtqkdKk0qQDsJnC5sL8xowyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7LLuuPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHClCc6z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7LLuuPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHClCc6z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK7mZ2729378
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 11:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=; b=h7LLuuPMpWc4vT5r
	iZvWVyFc8SQvml9jkwS10kJDnysIPHx1LisUt/rTKwksSija5xYzyFsJu2ap1My9
	KCkSeNxi4gNWU4zbt0UhJQdA5EHwSjeoCrhHJSvMns4wfsEBoj4WuA9zMnvlMixw
	oO84yDKT/WuDjxtYi4J843ysL3G+8M3mG92nt0V1M4zejd1jM39vEn4sDjOYmHLP
	tU09D6kb9gbRsiFItvFjJGG9YWB+b0vUMLm+e5/8gmAmm/ISVhNeRbLjrjZgtlIT
	xl6c2OjSYCJLgNVIk1oLjSd2I5NrTvQixVTC3j/zwZy/Ze3ud+Xg2iaVYo7rxEs3
	47ZBXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3aq94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 11:55:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso664450385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 04:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460531; x=1792065331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=;
        b=FHClCc6zH88Hoj+EyvA8lL96qBnMHMoKpc1nwjTWoLKslD/u2kzkZgF4Nv88V6fd+8
         7FVJFaxyXs/jGMvdQRk2m32PSxpcdGj38owRKAl3s9doSdNSIQhZ5VJxjBtoFd9pTTRv
         bKZepQ+y1zizpECzxqB10TtBTt++1SZ4LgjFmPVwQNo7mye4uXSktUi9lSxn9ksWZCUS
         q+lGWIuscJpkJFcwi8ebciLrMS1tEwSlXFX0/Zk7ix6h/1KIZithpEvb0Awx4wkGekAm
         Cub1Qav8LDUNSMIP5suRCGd7fK+0gYMh+Ja93Jq9ZB+2PicXdg0gInrcmQS81CG/+DpK
         Oj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460531; x=1792065331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=;
        b=nlNLOfDpCvDspfN6VRVTsbzxHCE6V5VLQCAdFgnwc7WkWLScKLkzyV+6vLnkevEbP4
         IQTGuI7fb3G8SIC/JFZyFVOEr2kfZa0OjeguDTaqrgPOdGKdlgAV8ime3+4iEdRKKy7a
         gNO86WW0Q1+uMKWn4vD9rEJB67t+pGWL3d8oE3H8oKsEp0MYZb9aBlF1Qg+yoXsfnhKX
         GSjA8/Bb2D7Qr3t5rE5KkfYSGtXFOMUBuliaJ/WnStPk99zR+s3YY+jg2anrQrOT2Hn5
         p0qxMttKhwC4uo5zKCFOC4M934d8c3Z4vSrHlIrWckYLvuOFhdKIcz4YaYKIY1EtO+VG
         q2YA==
X-Forwarded-Encrypted: i=1; AKwUvBxtr1Y9I0DI5EHknVS9YKQj6/P/puXjgY4SK4RjX9JUm7pFQhjkAO1kPepenzV+khTb9ZoFREs+NoAcWD0S@vger.kernel.org
X-Gm-Message-State: AFuF++kiidJDOsJun8Y7ILNnb74y4CP0ydaaIgqrh9vjlWS4eWI42iej
	nIRVXwM7lFM5zskFrCsBp4WUjnlQVB4aJhJ0RAuu0ZP4EOsIbVe1TmpCekIbJJ3HYl4qFVUGJRr
	orzg26Chx5pKvGQVd7iPhP/H8yrhGeTaR+eH5TB4ov0Yh+emY1KmlNsViE09uutIqs3Rd
X-Gm-Gg: AYBFou34g4HnWo7/bBPOnUUQX5wp0LvD5G4Wj4hFISbw1iKXFETXsFt1J+MuF+jgPyt
	P1dpJK9YhKXc07frnzGjL4oua0R26IyZW8MJeEnC4WAuS3r8tF4hXftSFF3bDLsC/3xPFLPsrwR
	OGyp06lHDMI80RKy8UE9ggdeAB+S1wCzVERopFAVkWdnhilwq4B2vWF11v9HgvIL2fk15MvhwQ8
	vow2ZCMpEw0Hj2kuQcYlf1v4YyFlLiAUNB8vq4II+X2hGmfV3kMtw6d3KLuEs20Syaq8eaOy7Hn
	cBCCDxzx2msgpiDDjRIaNZJ/BaiMOlsKMioCchcHfloBcWmjHqH5g26+qGERr48fxpM+2KugVUP
	SaPtbhQBnXAjZ4Z+V0n4Yvj7fhFWbX7jiFWq91EQqE0imb/4c
X-Received: by 2002:a05:620a:8807:b0:93e:9808:b9df with SMTP id af79cd13be357-93e9b83bab9mr959307285a.68.1791460530603;
        Thu, 08 Oct 2026 04:55:30 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:93e:9808:b9df with SMTP id af79cd13be357-93e9b83bab9mr959301685a.68.1791460529986;
        Thu, 08 Oct 2026 04:55:29 -0700 (PDT)
Received: from [192.168.137.143] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48c7af26edasm5607062f8f.1.2026.10.08.04.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:55:29 -0700 (PDT)
Message-ID: <59bde1c1-ec5c-4ae3-b3c8-61739f280ce4@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:55:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller
 for Glymur
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
 <20261007211148.GA312846-robh@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261007211148.GA312846-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac784b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=V9EgoYKVrGpsH2p6L30A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXw7KBl8yLnHk9
 CTpTElCsOrOrY25NApyQqvCBJfR00hA54tluGIhRMN0GfxxoUb8YWAayWGZUellkAnanf7ZPXYb
 NAwP7Y4T8253YHQVrjR4uF16KSyayL0=
X-Proofpoint-GUID: Oflw72niBl3PUbYr3g6E0kGMTRoVODU1
X-Proofpoint-ORIG-GUID: Oflw72niBl3PUbYr3g6E0kGMTRoVODU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX9IT8QAM07WRX
 bJ0NRo68278LBCKFK1YzzPfdDfhWk9O97eQTNe3rnmyfQJLmBO5znUvtm9Pa0Ew/DqHy3l4acsc
 h7qyHzg75Dp0pAk3BTzBEBirI8d3TIZFgc+L7p2OaaW5frjFooIu8iOvgq2nNwJqLnKX2vME2EH
 GNCVANbHxfhkG4YSAQqFmKBIx7xZODGx6XOFjT2ygvK9dCHstoqvB2xruAH7pV8RKwBNbEmoYyu
 jSLDmtDZT9PzpAZwcea2FtDu1plL/bVYEzM/rkI6NovU9VRux6gUJ7LMpBkfi/FquBZ/agKznzq
 8TC7zxRo44XT95txqy7VWAltUlrQqN1Txl7EivazJIKAmgbCqkp32NnfahH0UvN1mlqRR1Sge+f
 4aqGaB9/ETuO2AX2kYcdq1gQ8o6yBCZqcAW1wx5lxbs7TcqiU6bAvofKT3wUH0/vIM5zbO7an+O
 2OW4bAAFUVRBqQ4IkxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047

On 10/7/26 10:11 PM, Rob Herring wrote:
> On Fri, Oct 02, 2026 at 08:44:33PM +0100, Srinivas Kandagatla wrote:
>> The LPASS (Low Power Audio Subsystem) clock controller on Glymur
>> provides reset support for the SoundWire TX master when LPASS is under
>> the control of Q6DSP.
> 
> The subject on these should probably have "QCom" in it somewhere...
Ack, Will change this in v4,
--Srini

