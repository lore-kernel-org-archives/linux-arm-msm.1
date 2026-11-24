Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507338;
	b=yDEkUH+NDdjGViw6jlIRPqdi6Bne3e5WhJCjxxR3LS6YpbBM8EXUgjv6+/JGBtH7e+yp
	 jw2L8NMJz1M/CJaZ+SiowfAbyKByeCVq2Fr+r8aA+DlaXxP6D7daMxDBa/ncvHqnMhtF9
	 D0lZ8JGEUQzBBtW6UCPzlwZKyV+Zm4Zg7mOKrGK0msX2D21YdqEltCBbPVM4uNf2Tjcrs
	 r7rnCdVj0SDyBaU21JvSgmM5uDRZEP3QHQT3dMxMXQb+CHZIWItFDU/9zN0AKOsQUothP
	 z8Cw++gGrbXc/zZhDfxl6Em3hG29LpyWcb1HNuUr/8tTDew5vr7u9c3KBLkgTDdBrkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iNF8vqJ/5ROf+iwizzo0WHfuQJMXjmgqANoV1I9erPo=;
	b=iHODHltfXDw3Zb61LBNakBYO8GEhESHvg0pOo+nMVNLsQF+ol9Ox/pzbPXovEEfMO/NN
	 Bk4DlaNNfqfFjkJUShusC/fY8HvqFDM6VvXLqncwgeuYEDWdYlNtcLIh2bA/0S1ULhy/L
	 dvwYzrpG5X9wCKovr4nH1B0VIckWRcrC0BwSpwZ1gmm0oQmCMWiiViQ9p5IoRKUS2sIKj
	 H92OcMOpKR/a8CKpki9eS8r/SPxH7Kdt4dTpzRGxo9MwbqyXYnkEB6/5LMHLrHMcE1C0X
	 WdM43B44UQGNV5y7VRFletK0xnkzhOwzsmB5g981ZrasMy6Whw6i0w8m1v7UmyZ8xKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbMOHzuS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sj54s8dQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD652606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD652606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbMOHzuS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sj54s8dQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kHL42208880
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iNF8vqJ/5ROf+iwizzo0WHfu
	QJMXjmgqANoV1I9erPo=; b=RbMOHzuSF4FF0iOx9riFqu+D7O0nztByayyUsTJB
	8FBW5tanuFcTlzgNymchw72/fn+0eQ2VVtPjm7lNykaWFu+5mkkADCrWkD+dk7qU
	32rmtfIbkOX6XEQqMNKR7tgaTiUlmWqbL+N0SJxbsqHMjwpiDCWCA8ji7xwGzsF8
	ctnE0hQQz9OKwHGimI4jE37J6bSFam2+86DhzWaMKhwt/UtUFb9fSo7/zS3RBFaS
	LN+fr8OISKx3pu0ROqUkD4zrNaH/9nxNhaps79GTZ8Nj9aryNFBA3tAngDmmxRCg
	hvtJNHT/h8wIz7SozEX4SdfYVif6vXZh7wUTGMa1y98faQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy11hqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:02:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5297686eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795507335; x=1796112135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iNF8vqJ/5ROf+iwizzo0WHfuQJMXjmgqANoV1I9erPo=;
        b=Sj54s8dQNJUD56p1jcBPS9SWgWAnwfGVb3SHx2k4g9CLK8el18Dy3OhWXa6G5GJwbO
         TKYyup8W/RwtoouLBigUVdKdjQoMNqkCyK827ncp4JBivdIiYxX4EbkmpBZiw2j5ywOg
         elHdM3Kjr0y3rnh9MJTAwsDP+XpwdghxziNKf/oD6doDGfzVI0rJQa4ut1q09V83Lolf
         oAVIVzedl2YAL3U60SQExs3gxR1yaEgwRmOqFvvW3FeXc7Yjisg3f9yHfQfiE1tw1hBk
         ym/QpsbCmk5FMdeOHfiDXkFzEW8FfVncQdA2hVLx5ICoevq7aIfCpRcPUaLp3Iagr4V0
         Gfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507335; x=1796112135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNF8vqJ/5ROf+iwizzo0WHfuQJMXjmgqANoV1I9erPo=;
        b=gxmXs8VjID51ay+wN5xXEOX50JV5FG4ep2G/y980Jw2Q4PGcaHtaItxrpoZBrToYr/
         oYl3gt7+DiKHof74PZcxaswGBV/IQpyxD2D5ka9jWazsMK1p+Pp4K1p4DydNz91zh5DH
         qJjhPSSiM0ncd+2v7xiONyYu0+t/tyLzjwsb525pw8an1HV9TmuJdhh8UXs9MKprTRh1
         5kwlM3Q3qvmWvzaZq1yBA68rhZNMx55XXVRk/ZxgwdnVhu31ny+jLVOJZ5oq1R5IJK2v
         YhrY6vqnxlLLl6KughVL4kZ0NGx5H3jueCUnMtS5QBRD2o/d6R2vUArG5pjE+gPdH7Yn
         9UdA==
X-Forwarded-Encrypted: i=1; AL+hErFkepra3Sng4+RCDE4cUE3QgQaX+cgVVthmI1YD4mG2ozXZXeZUinYJp/lNA08XHcSZPXNpjXyJiI2E+wI+@vger.kernel.org
X-Gm-Message-State: APuU4Z/8kWbucCASQbDpB9acqqSEzgqUvUHbeVMhmjP0I9bkzZmrjKOy
	4dHYfVWgWbbt16gIljoPMTEXoAEfjJXBJjNoxH8SRqhHhgpKk9tZqV4TvTiDRYRHe7LLSxs4Be3
	XQhXDECQf0ywaQsXrBjpkao3GIShxrwGZG20JlB3pkZBangk1Sfk7JaAB8BUXwOECwoV4
X-Gm-Gg: AZFdTZfqYFgOqOgvoNyhJmr4WEtcoUgyC4DvhzVwo35+wV5gPKol3vRKUDHG54uX2Th
	wRNALWwBeEx5x1Illb5a+WaC4PPKBfTPOdwzKzi7b15o/Z3DeAAFGjFTqZ/98J9X5cYfk2Oq1cz
	lrS0I7phwa7J2FF588lbVoQC0NSPAHx0w1l6zislaCurXY5xONQos3ZCPcHIgaRlqyot8iPOHxG
	yYrLnj9ornBWhjXCs11ZgQrxd0HyxPd7xQkKn0YOQM5gaGbx5XgoGYVHVRpzSM1BGrP6G/Ef37P
	aOBUewazNtKpuZAyPgqO9a/KUQ24Pt62AXP4JrC+4n1yqExydvm8RxqFY+H1bObfsU91wXD625q
	6BPKGiKT34cdDjwhCYfeROw5S6dFuSGLGiCHMAPffOlfw/YySy8LwYGkQ+FMfYXAzD83ASm7iCc
	IDbf+na2oXKRK49UY=
X-Received: by 2002:a05:7300:f68e:b0:386:240c:19d6 with SMTP id 5a478bee46e88-386241b6d72mr12165666eec.6.1795507334823;
        Tue, 24 Nov 2026 00:02:14 -0800 (PST)
X-Received: by 2002:a05:7300:f68e:b0:386:240c:19d6 with SMTP id 5a478bee46e88-386241b6d72mr12165646eec.6.1795507334283;
        Tue, 24 Nov 2026 00:02:14 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm50432771eec.10.2026.11.24.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:02:13 -0800 (PST)
Date: Tue, 24 Nov 2026 16:02:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm6350-lena: Use QCOM_ID_SM6350
 from qcom,ids,h
Message-ID: <awVEgbFXWII8HtSr@QCOM-aGQu4IUr3Y>
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
 <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
X-Proofpoint-ORIG-GUID: J_ZOiAg-Jd5HbpZY5yFvQyMPDhEG3SlU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfX4bre/Rp7FXw4
 qByZE+8ga0h7c01BHWfmyvIKsQR7VYhwJD+uIIJPW1B+7oXYm6GA75NvU7dpPPeN1E2zeASS2o7
 r12QT2bWCGWYJP4LU0CdlVJU7FGQHV4=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b054487 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ecAgE6h4Pg4Z-y-LirQA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfX+6HFHMcJLN3z
 Vk+X0gZ/OWWHaifzOy4cPS/QuHtqJcNZ2bA7kGlM5jkwxSkcwn0qAuUTv5IXrm7tTgazs7wKQiQ
 vzEvPZ+d+VS8AEw2146zovmYv4jntxw0rFFxjbvovc2mEfCR+xsb4GY1Qzv/I4RXcQBjixhpYoF
 0G0BD4+u8sr1BRpsuxV9ISsWU/lj/hSiAoDfHPOcTK9LDN65arbnlScLOSNy5H/TitobC7wLXuy
 tmUbIApq79w466iTWRt3IRYMjoUMExrGXdw+0mu+qqG12rwTIHOvlwLkbxm0strPPP21N9k4aHd
 IgdgNiwaHxkq7zx7NEm/+EZ2FH3Sv5i/ppgmYnDhOCn/5E3cOUQUoSBxzVmrT3p3zDTlCBrD7SO
 +78jtUGOjGpiORKHbWnG0hbJAIbYehxN6Q/VXAIzAAUChOcK09sVMwwcJUM246hOv9IkQqL0dBN
 ilKUMCzrViE0pQg8Jmw==
X-Proofpoint-GUID: J_ZOiAg-Jd5HbpZY5yFvQyMPDhEG3SlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240031

On Mon, Nov 23, 2026 at 03:46:33PM +0100, Luca Weiss wrote:
> 434 is just the value behind QCOM_ID_SM6350, so use the define to make
> the meaning of the qcom,msm-id property clearer.
> 
> Also while we're at it, drop 459 (QCOM_ID_SM7225) since the Sony Xperia
> 10 III only shipped with a Snapdragon 690 5G, not a Snapdragon 750G 5G,
> therefore the second value of qcom,msm-id is not needed.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
