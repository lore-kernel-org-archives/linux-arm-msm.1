Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7E392C3C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851972; cv=none; b=LlfqSjLwG3bbm0eEoMxjcsGuetI/vLoZtsVuXnJZ1nZSPqtHcaM7RMMcZ2HGX4AGDcx8SQnaSqBQmriuDHoF7yoMPuftfR5rV366yUY56bxpJuZbMPaIvC/FA0mSG/yn5nE4pkoKllwWk0btvchh1DjGOLcN2xodU9O7tY2TBBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851972; c=relaxed/simple;
	bh=Ora6sadeyViVycjKTx40vbOAm0KDcOCTjb459MoIpdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHHzRPGS1frY/dgV7FkVf/ribqb9PLUPKec0fN9iiq5O5+bcz0r3O++bxNqPOb9I4CdCCfxIxRuwfOqOU+noe6BUHF0416Cs6eqLs9goOCEx5gj5sCTvLfhfHhN32RUnP32ZMlBx2awa9qeWZ6P5ZSY76gU4ITQak28hc6H5mmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yzfg13gu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnWrwBwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yzfg13gu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnWrwBwJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M2712172945
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MSh8ZXxCngtmXhzbngM3XhQp
	WNOjHFHLp51iif8TSwg=; b=Yzfg13gudpEGD8iWOaI1f/xcayBP+KuTEt6eFOe3
	DnPisuX7hwVZCn1A+tLWnOfZoexxsVSi02xbenAeekDIVOqDF02SyrnXH48dkWlu
	gyK8/c0YThlCGQuTtsQp0SVWDQBqSb8yMlQoHCgwP6G5k3at2hfnXxs8ced4mWbS
	Kwtn+5jMQoNjkHR6FNNQd5q5VJsBPs50eL4q8IqdQl3XY2PAo3Ngz7CGUrNfyre+
	ZEV8FtQ7IXVdRMAiaOy6oF8nx9sIWFEUadrC41uET9AWrRWZUlq5BtaaCV7CE2tx
	410DldZJ87UxN+61HBH5ho6pG5HcapceqbBBk0D63Tx7EQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrj7jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:19:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso882570085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851967; x=1789456767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MSh8ZXxCngtmXhzbngM3XhQpWNOjHFHLp51iif8TSwg=;
        b=bnWrwBwJlwiBM9asRH3WPrY7ytjuTI/thTvwyqUfu8qO0aVmp+88V4lABz8OT6jwzc
         OIUVMU25CWkypfZSy4zI1Gy21m71J2ggs/C9Q8rcM8Y+TG1JEPRUmqZYnbaI/IrdTi+n
         eCy+Rrd40tk1sH4QahXL6OTpC5CJde2JkeJ34T+SUvgdaG0bpLMyo+MV9EIDrKZTAboT
         Sh0oRDfe1/PL+qtKq94NSfR6p3ecb7jeZs+Oymejyf2tNpGtO5BM5aDr7ruxZ+DHaGKR
         DIAaQEa7U+ft+EsqXx1ungDt7RHYXKj2KxF5yORnOUhRkxvcuGtiha97fsmxojPlNvUc
         JKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851967; x=1789456767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSh8ZXxCngtmXhzbngM3XhQpWNOjHFHLp51iif8TSwg=;
        b=qgKMLpm+tR3zLh0pLyP+n0R+T2RIxmnMqRQmU4cXh8UAXqJ9kWs3UhK4TjmQzD4R5p
         9vSClTFEV9N/mofiPXP0aAXxh6yHaRV4yIju+tQgg5Z3HxlitwMR8WM+YBFF72tMJIBw
         LPJZ4hrbcVIdrQSQl3E9dumlwYzcjfxVPHdvi/2ZnJnxSOOx33oM5vfpoGKZ/KjoMKHl
         F6XWSY4xLZ8OqM3PeutJpnXMmQiet1PVQosMZ4B5OSTUEgvTM30JUlINrXjg2u/SJXQO
         PZfDPhJPxq/EZOpHGzVRuxk5GffKzvqiid1n9HEOsMmSVvmXwunfMi52fgmqcbdCRaBj
         egzg==
X-Gm-Message-State: AFuF++m/7oUZbxFNr8l+6vhksX+x/t0bLYwU40cM+q5FSrApJkwc5FpZ
	KKdRAzA3K8ptE1pQNz5AhQyAjhWSpWgIH414ypHVDEArjeCcs5dpmC0qN6uGXGSnsJ2xlRTlF+P
	arsqyz99YKMPfgLDbDbaczFTq1dIXkttTxdgzjFBRI40was1ESoYiQhtna/AKOQKSejTG
X-Gm-Gg: AYBFou3CdNhv/yjAEzVrYMdq2gCtrA4hGP2pqmqZ2czjar4vNFzPULQHm0zhBD0fcJF
	38q1uaEAzWErxQ33kQ+nVIayTm2MjvY+O932E4Fy3J/9e8HQMc4+wubs++pExWXPNheJkQArC7F
	+CXW79rfak9/w/OhvC18bYQKpVD5pC3Ch83WNRAgXNFCOg0a7WTISFLGEgazQHOe9/vFWlfCQ7H
	lAxxRzHOFQZBOFMfUPZ91ahUsfCPWjfHvXJrNi8RWw7gX9/WOi+ys2Tm5mFzNXB2E2OTvBfj/AV
	psB+zCN/JpSYSqofb1IhYxe8DM1qL4uLNEIRSzmP/nbVpNLCQEQBX/Wibn6iPOZwFoxYe0uAI/s
	qGzNxP+MWpvs=
X-Received: by 2002:a05:620a:2888:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9398059a718mr2929289985a.11.1788851967595;
        Tue, 08 Sep 2026 00:19:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2888:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9398059a718mr2929285885a.11.1788851967137;
        Tue, 08 Sep 2026 00:19:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm33045263f8f.3.2026.09.08.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:19:25 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:19:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shujath Mohd <shujath@outlook.in>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
Message-ID: <5enkadptjkxm5mmjjwtqehm4futxejzwewevoewlpeedjhszbb@dsfsfewasuiu>
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXwl5+9B6lr3Ke
 JrGPp+PXXCSjeVkScAOFhE84AqAzK6JZZFOZy3qnJEvpuIL3PFcC5voa8++0k0LbkF/CubIXumU
 o3gcqlkXP18nMPsKmzVOHrc3UrkSu8U=
X-Proofpoint-GUID: bJf2e7BrzIznkjADPKIJakIGFRrnCdxF
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fb700 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=i5nSP4-SYfabNta8v3YA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX5IkvCViIr2tX
 KfYy1MgDqKhWX9NVdbG8mWPr08KE7uhirfnAmJBV7H5mcYy+WPw/s57rO1Fsq5UDEkP40gN+ROA
 IWguVkNjs/AsrtfWRZO9+COzGUnNxM2oqag+rysr8ZewMCjgkGGCPZJkN3t0btSL2nrqcHHgCs4
 p6vjxIUUyCf2wVixRNVOz/SmF+ArD8Mn0s2H96n7w612lE4pl2hnj165INMWqT2Ol0QGT29dI9B
 WM6xz1gSV8Hc/i/4Cbu34j6kF2scrM8652osCS6ciJNVCRi1pKMIGOEGqgN97RfYq5BDz4JgtYz
 0baqcJT73c0sNdBSzcRWkD0qYeZcQ7RmrmNecn2hQChWbSblXNbRGLNVvKRXrWuPbR0D5MNGZRC
 r5ht3m1wBjfbic0+MEHkwLYUW/JXyQ9Tbnzz7VbbWdMsDOlrCAGpA5C6nst3FeYj8ybjMhhtsKs
 1cqqdxXvWY+vfQIp0ew==
X-Proofpoint-ORIG-GUID: bJf2e7BrzIznkjADPKIJakIGFRrnCdxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 21:33:08, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
> battery voltage and 4.245 V as the fully charged voltage.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>

So what changed since v1 ?
