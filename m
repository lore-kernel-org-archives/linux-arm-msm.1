Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AC03BB685
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108735; cv=none; b=faJH1vOLaXZLd5NkDNlz29Vwd4lesLXk5ne+iw3jqKuBOoB4cfRSutPo5iTJAuJCPmTjF90J38Iwk45zky7FAN8GEboy0mYhZTooTuH7Hr0ulKiwF+3300sC3SZ9C/8BU4Zx7SteI7a/g/XMhYX5a5PFkADLANgOA1TYVwHrTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108735; c=relaxed/simple;
	bh=ASTkN2BxQQQEVrM1YVxZgKSUKV7FSgAXa6lWoRmkR9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPW5PGfYQM684eUlP5IOFXzDK4T63GmxIeIOLKtUt97KfySPtDfx0MyEMj9TEYrJWtmCzzbL34UXJJs6ItzM7cwruw5EBB2D62OCWYWLyG7f+gkrjDOAmv537he8dwh6eprlvyfXQmoGOco43kwPg7m85GnlqcYPgRervWcj0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZflAaZPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAP7eSeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZflAaZPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAP7eSeS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBjOT3897614
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/lojMJZE8vqIlCAidGtcN2P7
	52zM4MGMFG5QUlObod4=; b=ZflAaZPll9AMQbR0BBvvxUbdaX+bP/TgeV017vD5
	sv7oSuHp0JbB5DUZJduCGxNDHXny3b2iFOvc7DfElAAirIX/fwbHY95c733kcv86
	h+H7tfidYIgZ8bWcsLjWGNXi/YxS8qumr07fJDaezFK95+WISAEaSc75H9irJUwn
	1OWS2+UOwPZkLPQt31hGGBPFx4zBNPBze0L72Jgo0sVkmyodFoX8kGFayT9ZMSS9
	heGVcYNVs6thsNELIC7F7GN7GkYcrAYi8M5VceNLLeOeTWfoSar/BBE8tYmNCDj5
	abVFyNWW+FXcSreM+XiofM+MwBm+Ubi3brlDjWVaw2F4wg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma0cbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:25:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9ebae1b10so140921e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108722; x=1790713522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lojMJZE8vqIlCAidGtcN2P752zM4MGMFG5QUlObod4=;
        b=FAP7eSeShKNz/dvd2XNryvO8JIrZizHIdZYwytzlLw0AtCOMTSXK0hcGL5uIJwgSvG
         WTeEnuASwVrFDLck8F2l9OmhUKdNQsPDjADfoQfdxB4midh3mRdXXqFG3w2RXHi0GEd1
         Zo2mKGVxspPSxNZjJzNzsZ/aZonbt/uLUpSRoPMfkg0X/GHcLmLkvE3PkV8ap41cys9t
         p4DcUoSJE7QLy1QKB7DMdg7M9WjWsKo39Ce0klMhKdx6xQFR0JoK36gzvCGrePdO1Lr1
         A0+8XFoi1syUnDScHz7Hs7v7Ask1OzduqAEo1e55iYzRN1nWnw1Ag+Uh2+s01EGS3arg
         xHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108722; x=1790713522;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lojMJZE8vqIlCAidGtcN2P752zM4MGMFG5QUlObod4=;
        b=kMczvUOomCN5cEhyUmDW0nvXq/yPnocK396CJzVKiwiE0M3MNoFFcypPKnJNHDcKBd
         FWzez8iLcZzZnie3GLZkTqP8XBdXWxOOSVQn8Muh5fGoWgjnoOQaOX95DIL/E07DJPHF
         3nsj2HHAWVmL7iNfmT+JM+ZE4SlyZihKqauS48u2JMGalXqdruf8s9XdcQFJb6HgAg6a
         JLZcrzqhP+WtxRWBsYyqTmYCOP2Qr9g6taMTabxpgcajvq6DYYGEGyDMZMdUaF8fbL6A
         dW6IwYDjRbjFk+y64sI/RPdABnIfa4DcUQS1PiHY99YLq4x6KxqfLb62gnzXUHEg96p7
         tTdA==
X-Forwarded-Encrypted: i=1; AKwUvBzjz6ym3mO7Lmfp0tNPjRt3eh54NK8W7/FMmWN/adLQ58xfcJh1cDrEX0+6VfmIoifx0klx8iXrOu1U7x/+@vger.kernel.org
X-Gm-Message-State: AFuF++luBjnM84MSG18W62h0agTXzRlmKWc7edICNZ2OUu0zf+CC5vCW
	zS6IYHiIV69wU4ZMtbO9Us7hkLPKsOpaHMYYlx1oXIOKLySIcUKGK4Kh6uWcm31w1LgBRxNXgFC
	w7g0Zh94iIZnD7kOTjY6vj6KPjXGHuLyAnq6OXJ7jk5MwOzGiBlHRyt9DMVsinGTC0O4N
X-Gm-Gg: AYBFou1E4t7WNQC/eVNbzC7mY0ET1Wj0P4xBqYJKu7NX9wpvSQTWZQuas8h3PGodiVa
	0EGBTCob9/O/oO2LSDRDrTwb0lYXtRnzmRDi736OmP658BeYsqBjPA3N8rHzOGyCNDb8ZknxnJg
	QnKve3ET8Xf/FarKCRdhTgoi0lLPvIjfzxrJtnYbNZbJfSXLLhZ8DBA7aZiSRx/EE1hpKR1JLB0
	NS4IXG2mt8oaO7KoCTN8nTFj2wfouShnBLF+R5mWyvj892hvlOhU4NOoaX+LN5ZYqzaZJiMjocN
	n/kk35B0p7BR6O+QV9OkeoQyNT/XWkOw0ysuoVekSHuvJmKbBr+8eoS3SyRGYk9odU1J47dUJV0
	Dj3xVsu+UFzYpvu8=
X-Received: by 2002:a05:6122:1d91:b0:5c9:c60e:f4b6 with SMTP id 71dfb90a1353d-5c9f16a7a43mr974523e0c.20.1790108722208;
        Tue, 22 Sep 2026 13:25:22 -0700 (PDT)
X-Received: by 2002:a05:6122:1d91:b0:5c9:c60e:f4b6 with SMTP id 71dfb90a1353d-5c9f16a7a43mr974463e0c.20.1790108721632;
        Tue, 22 Sep 2026 13:25:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868266822sm1076173f8f.5.2026.09.22.13.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:25:21 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:25:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add PMU node
Message-ID: <wkhpoogmpf3xuoq5tqpxznoqvkthfquupki4pjfdcm6c5kwm2t@fr73f6udyvou>
References: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rr087AqoL0JMctCcwEIiNhmKNoGHSk6Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfXw26C1NaoP2zK
 uMPAKfbheDiA4Mlk+SfdKqtK8ZJMvAUEbtqE/duhBn1Bl+M8SRmTF2F8DSkANSnCXUcw6A9b8W0
 mqxd6p1ew3W7za44j8HzhoeizRjc7WY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfXyGewbwlRsmsR
 +5FaKeSOW5JDNinrW0L3xpE4TvfLuiSO59NflfaRaF23B0nmOVNWH8NfHgjAYifSnckzj15XEu/
 FMhyMOxPh39gLamNiY+GqOss2g9gVxA5xK83rnh8bj8oVPppEcHjaG9URJ/wn2zpeFGupzzE1af
 mexbuQwNOI3t3a4liBjJMSeaTUJBwgX3XOvOfEi0Unc+1zyHn3NTqKvFty4LCjvv0EIUQQFyVrw
 WTTMgurdaIXuNpQKZ/FODIHdR9mc4rZyGuw0e303d0l2dtKffF44cKz61+yUsqylGEQfdHXhDSd
 tBfymbXbmz9jO1Zac9Q5ndxrng12yDbV8nhvTAJYJ21Uv1s9v9KgaUx05F2piTjOg7Xq01WZ9zi
 XWHhSWqKXiNpzfxpDTxr3ruQTKJRGiBxpt7iQ6kdqfK4AGkzJuJWGc3ZwObtLcPUP4rLq/FQsp7
 SQv1SOUmTbKjM1ISSlg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab2e433 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aHEHYAZx7hSDT81ZUAAA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: rr087AqoL0JMctCcwEIiNhmKNoGHSk6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 17:34:46, Shawn Guo wrote:
> From: Anurag Pateriya <apateriy@qti.qualcomm.com>
> 
> Add the top-level pmu node so perf events can be collected on Nord.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
