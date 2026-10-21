Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589466;
	b=SzSSJ5U4Z4BGtpX7gmK4ySwfTn2gafeXA3PQRL7Rd1UjR7k7J7NbdM4YqNKkNF257Oeb
	 PvkduT9vpSuJgOcYo9TIjTCcR5aRAbE7nd/7hwrrtMazce0wWAJdN32J6kKPFVyQiLSN2
	 NE7y0zbRs30BT16kJd+vHlBcus2zhy1FLkUv4tpOOuK9LJ7tR0yBzIS5g+MV2a9/Gk8Lu
	 oTgNVc/hjj27MsCniiunFWEmwGzu+xOvNdG1wtezIZKqWxmRTR4qA7X/+/HN3eM0KsRLY
	 mXkIn2aPjVxWDnrhAvc8oTX/IWn+dIcpAxpqTqZeKd1FCjUrZd8sMgVhH5sioONOkrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
	b=tKzmkLmpDug3in0dIl2rsD/fKT8RLyGbbuhHiYJjWF5Wp/zmiBqaorznGC4mAC7BFkUF
	 oc7g+7S5rFVTJYrufT8XoOnqfAM0H/fp1GTtALJ3vaNB/uy/H0sWVRNIOzdckg6kSt4Bc
	 BTK+1Aui30dLciKUrEixxRaFOuwipeNvynoq3F8echTADsxr/tXRTPp4D0K4LcWGGvafw
	 Hc0SNZoqwsvxePts3z3IlDdvLroQ6K9TuQoulzxIGbXb1g1bJvtutYBkS33MDo2FhWArO
	 8y+NxZ/En2V9AcTYDgAE5TSsnZOkqepamK1/gT0MvOPZTtt+7IY4/QZjdaNgKHus+Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pQqs44tg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjtGRqGU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C210606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C210606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pQqs44tg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjtGRqGU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDHS9o4038203
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=; b=pQqs44tgcz5pZmRR
	J+PL09h8iGzeIVc2QZKPEASJcxYzDdqWsxf9GvGSnjnYSgH2q75tEVbg6WfA/EkK
	IypXPa01tbkYz/yJYAlPQcz49lACIoIe4oRQqEc1xnyVuRVwqUeA5h3shGHaA43D
	TCb5SR1SRPnd2EAMZG2Hwwacp8fxU/UwM1BOhd2pVh79/ZhNTTadvJEjzXiA3Kjh
	fm7UwyHgeVe0k8G4Crn/yCeH/zseGrSKV1o6CHbvZU1ZsXfbiO0jO8nZPe2OrFwy
	Hse6HLN6cdjp+qRS8hc2yc4e8GKaX7s0B1vg+o4DUbMoCWug/w2wsia9Oo8Qi2S0
	moJUJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex58827g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:30:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so14523085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792589448; x=1793194248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
        b=CjtGRqGU9Qrx5hv/bxLXcKS6mzo3O/w9SHjMBHpu1W8FOCWIbLaW1tmTAh3lAXR7/C
         /r83fi2i3T20Tw9IUwakleR6eE+UNkaohJmhHY56gQDwqV2vRLnARsDs082+0h18zLhW
         FplkvlNhP5k2gkDnfkutERgsWizEBx5eQbLKHPG2s6MtqSE4ZEOVv9h54Y7l60If/IQ6
         sw9Cb+CGfsUG1slkYpFr0Xi7FjSmUwq3A8bWYPi4jCpWBqeFuR87gnEtGrkTD6TcdjwU
         Jqm8QNv4JrxPSR+VpX9sgwzAHmzJTot21LJMVpZVGmox0/r4uXeq4jbaleo32OeBSFWA
         9fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589448; x=1793194248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
        b=vxFvKN5ST2uALejxMcNITSvWIum30MSJ1Wluf8DAHETbliz21glommiJcIYHv6V49o
         yZ/TYjCxknCbFZa41QgpS7e5ixkS1U9sCbkQgnJpWxb5JWC1GWi0pbIrXv4KnO9XuXK7
         D1ySoamMx2DOhqo6B0ESkVJEU5FXmomdMmkH9qoaPQGKNs9KvWmph3yVw2w+d97AjZiX
         3eiP30XcvxwfRXft1elL2NcJoFh5nFvSYPfLzmt+GsPTbORky3Zx9cRRK5wJTNNxa1Yx
         qB64SqZJgNqAFIOvppEmYOF4lvMguBiEuRKp8HdtHwzS+udUyHkH+YRuBs0nBoKCvA8Y
         1NYw==
X-Forwarded-Encrypted: i=1; AKwUvBx3yrZ9LB2K57tkhza7kmkjUxrOD6ra3KBLhpCkPDe86oDX64c78KourDqvad4805I3jQzCS+VJUdbIXMxS@vger.kernel.org
X-Gm-Message-State: AFq9FYLuA3x9KbyVrwNJPZojAxATgVUsaemFMSkf7Bnrui5RrhcFl2jR
	hmrSl0xhqr28Zd7w5Asrf4glMH4u9jCNy7q39wuxvEg0t4Ozl0MJ9tkBpi0o6kZ91kRgDncZ2mC
	xEeNBhf3XRhiIrNSN+taY6efYTFg8aWtxlrvQSoGGwFvmFrWzuHLimDkfZByTkU5UaSmi
X-Gm-Gg: AYBFou3N26vX719jvkJwvvU10rasU9EOwASWvsJbrKm+Q2dVtNes08/xf/YRXlQPxEo
	VKHLKlj6V/KiMXrlee3Cb4kJuFWNRXuo39owoEn9crIolW5Ig3Az/9i1lIGSZQ9ufZ4KSkL3Tw6
	oPTi4d0+wqCbdEtW6qhjRQB4UyoyBvRMlKrlPdy7MEMpBpk6AaMtJHcZO5QBeMZZFcBBjox9ETz
	JyMOzNr+eddB0gfYMI0ORK72wRLie95yIiV8uq8y6OEXhJyfUZ1lA0jD57J7hPNC/g62wpmofIQ
	XnvLesyBwEeMSj5QemzKdrSsmLngySCradqSOQeY6YkwPWccVfOqTgFi+2imXD99vfoQxLEZBP9
	6IwZLQMcBkn5wiRIxXLqC6A==
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr478786285a.0.1792589447763;
        Wed, 21 Oct 2026 06:30:47 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr478776485a.0.1792589447109;
        Wed, 21 Oct 2026 06:30:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1224fafsm523382e87.63.2026.10.21.06.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:30:46 -0700 (PDT)
Message-ID: <64a9cda7-6a0a-467d-981a-46ad1f4345f2@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:30:42 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: maili: Add base MTP board
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-5-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-5-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfXw9Y3twncQyyz
 nfC9ZFhGrRyj2pWXSHo6s+FLnSHTtWWa27zYQo91dG8+EGAHU7hBH4LmRgFucXLD3VsAyCzhr2c
 Z9Ur/Uaretquh3htd5mjLSekJr4mf4g=
X-Proofpoint-GUID: byEPEENOEfhu5d-XIlhuIEIYRMz7TD1n
X-Proofpoint-ORIG-GUID: byEPEENOEfhu5d-XIlhuIEIYRMz7TD1n
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8be89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=E_2GH4zMFfp-Yox88fsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX+MoLhSVH/WvF
 QeOPIWJSuG3NZp95sWgx3wuUvrJQ5TlUxhs5vZ63NZR7ub39sgTZPdLQUsFuwYgcKRt7Q9WGZCk
 OE5Is6BzncdfBxhhcOxb0ZAElRTulfE4PRayLgMKM308dz+M+l7Q9t82z7vXQ4r3cd21zdH27DS
 IjoK0Q6dmFPXLz/TbW0U/vFgARMwynrDuzNMOMdL4HvE3cqyUIyksBSul+iItforLz4O67qHQJB
 Sr2mIZfkIY5iQl8Mr+vY1TA0hU29tccaL89IRsRZTyuXKqnJUN8Afp4IItYCvLnojT4w0WSa5tU
 RrA/0Jr0ywLOHkTQ+628eWj69x7FJ2J4+0ZMY1hCeAqOLOMY+4sE1/E96BMhPxjEK8GexHNjO55
 7UH+homIHup7E87jpZ6uhGxjn7zBygTXl8sC6o19diZgMHm3YT7Wrf31pCuHMl0IBryDJw4xT3J
 PTGUn1JpBkhd+opP5KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210053

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> Add initial support for Qualcomm Maili MTP board which enables booting
> to shell with UART console and features including UFS, remoteprocs, USB,
> PCIe, SD Card, PMICs and devices for keys and LEDs.
> 
> Written with help from Fenglin Wu (added RPMhPD nodes and PMICs),
> Nitin Rawat (Added UFS and SD Card), Krishna Kurapati PSSNV(added USB)
> and Vivek Pernamitta(added PCIe).
> 
> Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
