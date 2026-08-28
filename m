Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56B75809
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922962; cv=none; b=p0kF1X5yKbqsLRJhTjMxKZqS93RPvqn05Zrrunno8eToprKGy3toT4CbHuJYUioftP/FW+4adsDvnFM7s/rN6Qw2tZFMLWVsxbPtFSgWBmcWuksol1LOx25Gw0p/1rzA8gfVfFQrXan7FFdZpp51AtjG6FIbv4aLZtOzVcqjkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922962; c=relaxed/simple;
	bh=2Zx9yqyTqxl13VnoZtyz8hCPm3+mqxaI2mjb2ljqRp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQIgkBsFypv5O3ZaLC2jRXcUw9Cqzu7DcQPLC57Dqnd1Sk6+098NCCwFzXFphwaAUVd66tOAkv0CtxOYqbSysv7GGGyJEW+LyrZkPUcGZPdIVevRRAUn8W032rMsLSC8UyEDH3xZJskxGcACQrskYALAINBGu9YVOzy7JCOB1SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoY+uzA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiRewxHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoY+uzA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiRewxHD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA80Pi3750816
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=; b=IoY+uzA7jwVCyC4X
	S/z2Ewqylvtn/n+wr25cFL5D7Kk1Cm6x2BsMWAGjMaVwhJtKR/Ukvc2nX38Eixfj
	1ufWUrdYysx9ghoC9JGaHhtx9nR57fj6i3az8V6RA7RDVIrpiaI492GMDxrFb2mp
	C9+c/QVH5P5N5EWckjR5hRTyOewIvWl207pPyIYGM7drsG+mg3yTnlP4M0LctF90
	4mEt2LJZxillyMpWM/5FOs7Rj8GrrOAsRi014WCMt6zgS5jcSQf3N8aMVVb+wyxD
	pFtQLMy7Bjij73eo23/bUUMtZaO+3ifcwSTC1Yp1WWEji2zqJBosRmm6DIEbydzT
	wGsU9g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afgmv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:16:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c673f01b76so30522e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787922959; x=1788527759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=;
        b=AiRewxHDNjAvE9bdYQ9sjFo5exuz0w8IFtBBJOk9ZnFAPpkvh4k3jwi70dZKZuL406
         PzymRvcs/wfG+wk6GY4IGTf9dLFt7dBm63lEQ1e/AGklbxWX07BVuBH0T2/WB+1Vqicq
         l4I/8la+xkAk6AvhEliPobKfq2+cZZ3qIhYIhAFXyuXLhsKiz166oblJzVnc1jdJ4yut
         jBgx6xzkKn+gqbSV1lKi2J4+cmrcUQtC0lpl+r51810AsptqC4O/cJUld5ChaXkZIuyI
         5BJcxHTI+hQOGjS7/w9oisj+fW/XQdglx6jXgcOT60Am+wGW0UdM5SYO8Aix4XSPGR3o
         PoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922959; x=1788527759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=;
        b=Bervkr9us9WvgY6sIIPhlB6ORgYUz1oXRjiV6aVKMI5lU+UIwLST1dx+3xUD6LHiLt
         xZx4nNgTUG1RFjDEdfzkRg3Hw9j/eoRnPxO8vUtFwEHRkN+QDRrNzXhNe6Wv52WilrgM
         CeZpC4HJjSdnP0ZpYdIBaPylREDcdgzClXAlUdJBlmHQjGFhENxQzGP85nMzmjP8U3cB
         dsyrgD5k5EROL5Irb/aolgB+xILbVRP/I8rbByb8taAxfMp14fIyiV52iSNhrru9CnD5
         0Aq9Ubujt6KBOcyEq79F/HqjcEY8FWbdpwMRZuLn6McO8DJtRQZ6AcQuTMHW3BlIUJkA
         B+sQ==
X-Gm-Message-State: AFuF++kp4fACKSKnr4j8wxSSmpxCSaUbu9xLHg0/gq2k8ToyfORHUi44
	uKMg+MxcsBPtSFqXPIC0FwdKxilAUyT0DDQbq2O494a+TOzxIN2cQUrsTIYb3ry2LJ4LUDWIAU3
	IBXVcdXN4C8k8+AOBuoOAVAiy35SQc2mhb84wI7uIBZEpTWTyboOcHeWXPN0Hdvq3bylc
X-Gm-Gg: AR+sD13Cg+EKzXbyD1N06vT1iHcEG/LyW+Ak2m1OgS/EAkjBs6qD4QRhEFC7AoLgTAT
	OvdvCyM2EvyLvE2FeggWG1HXdlIA7q9MGJZoYFllaYNShEba4PGm5TtvQI4Xpujxx4igOQuawB5
	v3sEgoR22s9gZVl4sO4R4CrG6dTl3lILhEX5L6x9SOp1A2YJ92fjgZuGIbG4d0xk4w9/o5xgcCy
	JL0QZkzaByjlPwCRTShTmgYtB9aUrDdAiw8mvTCdeCDRaIbOsOXjCCLmXJsUKk/s1GB8fkrTY8x
	+O2jn2b8iEnY2GVjz28n8BdVoDd574P72ccstLKdAAAWfWDRblTpuQMWnOHp/oAmxeABgZUgF0F
	7Jw3DFcqH8gQkyQFHlH1tTyw=
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr1088505e0c.0.1787922959056;
        Fri, 28 Aug 2026 06:15:59 -0700 (PDT)
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr1088480e0c.0.1787922958564;
        Fri, 28 Aug 2026 06:15:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09c5dsm79123566b.8.2026.08.28.06.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:15:57 -0700 (PDT)
Message-ID: <8538dbfb-ad89-419d-90b4-4e92c2cde3d9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio
 playback support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R17GKXZuYHVIhNr5hgZ5t3MXS9TSIrb0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX0ZABzmS5obQv
 DGw9ibB6S5UBePSjHmQQk+z6LjHtw7IfpfjMBVbj+knSbfZH+YXRXDDqnaTsn/D0Q2bn6ummdPI
 KemPuK9my8sAehE4Y7/Ak/zs8Eh2hpM=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a918a10 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=EAEWhcUvtLHaY9PztCYA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX6XnQawT7vaK3
 Kk8tXZCQMvoQDONRZGP7XZ043fKP5oqYR2RRNu+PNmVAKnnkcYVduNmGby3ndeX1nFq2cHjofd4
 72n4G1uTuCWv+930HTH+bZt8t0QIp8NZ3QhoBY4SLzlPLZxM71Uh7VzZn9RuMpHIJMxDmDpiVBy
 TZLqwz+9cUaIr6iMnslpLBWP8dqe5c9YLvw8neRs1HWfj6S+VA+dQgastu3BSL1jefUMIC4pcq5
 kLQirCmNovwJSeb+RDLtKWrnfb1MCbKXKFIn+yvRNc0G1ZKKFPjx9qe3eWK7PVqvgd2z6C1EVmq
 yKWNk/7RW5u9AzGSO4m7zERZth4ABJywdE1d7wCWBw5lRX+ePYQtUic7MoJMeWReIUIyNudj28h
 qYrJkJuQRyW3rq+4a+J+a2RgD1qt4C5NjpHMe0tW4VFqeGxZgEy+fzT8n+nz7Y7zabEF+zfdbUj
 3G/M01rabGKqTPfiMhw==
X-Proofpoint-ORIG-GUID: R17GKXZuYHVIhNr5hgZ5t3MXS9TSIrb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280114

On 8/27/26 9:52 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The X13s sound card has no DAI links for the Type-C DisplayPort
> controllers, so those playback paths never show up. Add DP0 and DP1
> links using the existing mdss0_dp DAIs and DISPLAY_PORT_RX_{0,1}.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
