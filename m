Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968303624B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025463; cv=none; b=JmldkyR485qxCuLc323U1iT+WbTgHPpWUMumyZIDxiXxx0w9AvIIppoqHGrB2ugJSJcvt3RQGk3da+u5btB+ITdxmNrTDdKXA04IhXRJ4ClXFO/dD1q6fm8ktEsfkOr9QvRYd6uEEBpn132B91FESl8LuIbvgRBdFkR+uSZ+YOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025463; c=relaxed/simple;
	bh=AyVcerJHylSNAM2SKa21XKFVG9gJYJzCjHvH/GGyVzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUCmj2QBpePiOcmesFLSfQ4+yCzMiddk2ZuM96FRMrDWP139lKpqkoyvQQGE/DBm4eUbC8x/gnukdsfzr4x9Lzuq1YHFz7YrZAJuxK9WxHwIRT5urjlD61GE0RvD3MIdtqYMgUiy+771QmLJRhetun8tO4Y1ImxVD7lZBzLLNeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnZWzuz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifh8Y/GZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnZWzuz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifh8Y/GZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Grax3520292
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1zYEZTvqNgq2Wlrbj8LO7oYe
	IOOP1BRgRUxnk+w7h7A=; b=KnZWzuz4INn0Z5ha0Dn1qoEOhlmjLOGSGoFy0mk7
	fAFy1PasPV4rldzbJ8wtupC3fLb/1dK5o9v7q1U/OG60YMzkI0jqyAaw5A/dK13b
	qGPwpo4poKJvj/i4sn14KGuChASFiNRphh+kxpmS+KfMX0drTrnwMk6hx4To5Raq
	CgR6P59fuoR9yLkVxq3W4jDPm2s5Yfm7Wzwejvx2RFDsccwLy1+mY3GiVdNjaCUu
	Ev+Z7mCeB6T4jA+n9wcViKwoTi/By+B+THv9clK3QCYASPF3qYDkiyefxlseGytl
	tv6EJ2vZvvPGwN+oGIreFrnrwkV1cKEaASsbt6H+WmEJ4g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfjqkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:30:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so96923056d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025455; x=1789630255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zYEZTvqNgq2Wlrbj8LO7oYeIOOP1BRgRUxnk+w7h7A=;
        b=ifh8Y/GZFxLAUfD37yUlmKmv7MzHi/dbAqulKpX2wj7W7h4R2NMZTybtBogf3S0Giy
         ibh/TJeTqpVztZODp8OA4E5T4oLm057LlGIUfz23v+KnPoYC9U7bdk11z76+0DJPUU4s
         WGVd7Epd+3qqsZwgAS1GMQSAmKNoOx/676U59AXvlgbJ0BTLbgx5X7mH4N6gsgZuh2QH
         4ODfjD5TKDWEGDKC/U0y9QPcBek4ARZCCYPqPJaX13yjb5IzJjbqeYdotbax3yCvAzfK
         NdibcZOnxGrwVarYgP/OP9YO1fPDnG+0rO/1DHyOpYrCaV2ktsGHZuv4/6b6DRL4HoSh
         pz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025455; x=1789630255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zYEZTvqNgq2Wlrbj8LO7oYeIOOP1BRgRUxnk+w7h7A=;
        b=lq/8y+eYhgUjt6ZVlyAAoXO4EKaRW6/bJppojCYGp1TzZ1sd2HDEuYRrUodKodcLjr
         F5axNpnEbNoYCDkZiXDFdMU5reSZXF2ioBF6jbTYWi6z4OFR8MvvGbaB4exbN/IzzidK
         PjEPAWqUA/lEYHWzVQmaCy4AaYqnRWLoL8dcuLBAUB6QAL9ej4tgmNFzr+MoSjjJaDEz
         FmZPwV5nqKs8qN1teCJrSmMfFsKC6LkKyBh1PUB7RaAgaJ6Ij5+fe+AIGvpyHHouBD8F
         NeCdsYy3gmSPbI3KlUCjbTPZ0mg87MlLbv7wmZxIE07+SDeJUJe28ToI/+CUOiumgonw
         vqjA==
X-Forwarded-Encrypted: i=1; AKwUvBxrrPghCfoxtu/pUAdz+S8PMjsGImeiiGRYfGTb3GwpxyYs54/b0B33Zqyct0kCMY+HCG0m2LqGjcKEyO/x@vger.kernel.org
X-Gm-Message-State: AFuF++kgpSQ0bCu/jY/5QzIP/Kaq5WTsgzSNvZddTpfVTiPF1LX8mCEW
	5hZj/pYWm2TMsymg0WMdOQ7myby9cVfd99nGqcuwRV2fPGu4YHonaWF78K3dDK59BsjpgGY4Qnq
	Q4/jfnu1VFJOkbBDcJCR7wGpZpuCSln4peXTJuTKJKV6dJ08I7x6NXrcRyHGHN3Cyq2m+
X-Gm-Gg: AYBFou1Xjv2A/fqD5cwncxKVtIhuT+f+ArbOGMhn5XWE8snPFpOpRWS9VQ0ivuSTG8e
	egFJIGkmMPsIGiDswcppXo4QGLOWa10SpcyTyYY3lPZYAXwRzKHnqYlbl8LwASgANrrSiOH4Wwr
	U48lHjgazsnVOO/qkeMjiOx5fBd9wLbSVaO9MWsiOyHSS9UuEVNgWei1GcxT3DfpuFuK39hYTbn
	4DOWx/dlPsUyQ6KqNs0XLvzFt+Ua6Tga507HjiAOpttusJ5AsjWAemkGtcUYioJvZIUkYFMbxk+
	ypXNBzxE3XNPcnhjAtOtP6JD8QyzydFnVbPI6gaJgn87KxLnnhYtOgP+p955E/XN2cqWeB1JRJ+
	Uzi2sGnIuaI6+
X-Received: by 2002:a05:620a:454c:b0:937:27fb:96f3 with SMTP id af79cd13be357-939d4972f56mr731156185a.17.1789025455346;
        Thu, 10 Sep 2026 00:30:55 -0700 (PDT)
X-Received: by 2002:a05:620a:454c:b0:937:27fb:96f3 with SMTP id af79cd13be357-939d4972f56mr731150485a.17.1789025454831;
        Thu, 10 Sep 2026 00:30:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm55293034f8f.12.2026.09.10.00.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:30:53 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:30:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] interconnect: qcom: icc-rpm: Handle
 icc_link_create() failures
Message-ID: <squplyvzsl743rhov266cdvtc2wkahxfnem35gcfus4pnn6d53@r6ofvrmh473j>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-3-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-3-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX5OpdsAyEbGKd
 u8wNPGI2BGDJATn3LIa2WVjEeuzdBvYAVNNysEXBtlziav65Wb87bqvPUNyBvSuBa82Fx7Rv1y1
 cYN8EtRTrTJMRpdPITug63khpcxKOUo=
X-Proofpoint-ORIG-GUID: w71nRNGH3PUzlmqSjjnmyfQwOq03poDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX/F2l2eU/Ua8n
 ruCjITfNEX6BcVnr1w7D2Iho29F5d6Rq50PowxWr5C/kQ8US7iqmiQ630kLGWQGO8wY0mcMoOFf
 nzVmyiBjDpu0Dun7oAqRl1kMesHiZkhXBd9gBAPrkpQlZGlnDloeznKfZldh0R4Ni6urZIhF2FF
 ss1SuCoTrqwxIBSI35SmO4i84dnUymNNXDRq23S0yIelh9fXmkqTLw8yrf2HoIWlV57sBT7F29w
 Y/Mp3cTdwkglz4/YokjWEdMyrQwXwSYjLPa/eflslytobCPNdogv3EgSiH2laDf5ilb44vsIMKz
 o4YwaIRXgHGlW+kNrn0WqunU+I7m9iMa0rAkUgFkTHMAZIYxX80saTCSNdEpM/LA6Kcm6Q3fDpe
 WrzSrGOl5oE8Yh8kZHtkYdJdqkThk8JSEygBkMwelNh9LH6Ix8jB89OeWg1rcf8cD/NTAfLnkaJ
 m3ck9GBp7m/rPDtL4kw==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa25cb2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sWVvvRLjqkiOkWxATgUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: w71nRNGH3PUzlmqSjjnmyfQwOq03poDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 26-09-09 18:41:56, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> icc_link_create() can return errors. Don't ignore them.
> 
> Assisted-by: LLM
> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
