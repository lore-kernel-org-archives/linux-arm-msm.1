Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1953DCD80
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265369; cv=none; b=fg7ZiL2rmt1+m297OPF7/7fSSJ9z1lrO1I7B68o9YgMUn8kV1tgxSfJ49Dj2MJZlXUNw2UtW3Htz15eAxLJwDHvhUVFRAcWG7Iropf+ZVMQr7WlXiD/Qtq/nYPQkFRJRDvWrZVPQnlh6AJMUz3P/IYy4swlfHqf2/b2EBquDLJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265369; c=relaxed/simple;
	bh=9Chwd0w2EDIAHB3WrSewTF0LFKue/rO2MaRya1pagTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMTweU0DtKHAdXWjoDnPV28ZL8cjGphzK/kkFSOVNSYX3pYKjU98LZ+HQ1wg3UZa/3KQBY59O/t8LAddotDGKYFOhtyghi/gf30UkOk8dN/yCknVQ1rYrVxCNgd/aRRAgtk4DPQ26uthXlA6lcq5gPwa6TtK5wIvOASBQZVMrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQ4lw1Mr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuHuOJQn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQ4lw1Mr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuHuOJQn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJc9t2406408
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 12:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u9bhKclenKPG4bSJi3Dfg5sn
	oNshWyvaPdPox2LBfdw=; b=lQ4lw1Mr/YKKYY6luXGya7LGeGohXeQigDhqPSEC
	WPAhwC/RwlAzZMVA1usY9JOWSS2fZu7yHHuYd91PX55nGj3eT3SuiLJ+pBP4WJIp
	LusrB/KHNaVMYsBVT9XMwEHLFNmZ7w06js9O0vDHcI3Lgh3GolkcS8m9pIJPvDsJ
	lIn29eInHjH2fjgEuULX64946KdhQJ6gSKxpfJZWaW8oGBcItyjh+l06l+TH8Xk9
	FkrQbm1S8KVld4VwjiGLnt6R0p7ZLSvngsiLYFOvVYtT/lUmfGYDp7QNF82O5VtF
	Rv+spqI6DfMyKP50CgNrXCWEE0iED9aN/EmU62OpCfXswA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r295m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 12:22:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e52306621so631232185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788265366; x=1788870166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u9bhKclenKPG4bSJi3Dfg5snoNshWyvaPdPox2LBfdw=;
        b=OuHuOJQnrtnQ4NtbMlgXPKMV9dIrEcbwWuYPBzyQytuCA+RrxY+6CeV3YKz2Rx5I68
         YxU9b41vVKgDD9XW2qE6NA5KyLnIXTeMMpbpCQCBZBHU8+2MfaP2aIzQQ277dsoVc1F7
         AcqipweMTfZ6mKtSpMvBb35xxQrBcWMxN3BeP25FzXKqep8hFo2d/l3he19aDSrMI8gt
         6Vja9dG8mxGawSsHc9EO7R6peuSCiYQvlWZXDJ7zLlyzGHf8uPyuNdAyJYDs2+/fprh/
         FF3pkBLoF0VNnD+dHsSqh+DUJCfCesdIn4T0ceS2XQaGXqwyaa9tVF0SrknIWS50lQH7
         CrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265366; x=1788870166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9bhKclenKPG4bSJi3Dfg5snoNshWyvaPdPox2LBfdw=;
        b=AwOhHttJ7qsJDZ+jFLsikqqCqnuJGPU+QNzHl5gHIcloiGG7mXsH9mJQ9wjM3WKr92
         T2Fk2zvvfzGsvYaUVf6CghqOzclHdy2Wj5NyAL2Z9yWqARJ5IQIrvU31tboqYTAeTUNW
         FXyFiwscOsCA9T+KHxY/FMimNgP1oRTD7q03c8za89iG+PFH6bMOYWcyDAqTpJ7s+mHc
         4KtdmSg5QxHvQH6tujGVrrEhZP1yWKs/dyNrNS/q+b3HWB3kC6Tk1/oHH3H32tpPKu/Y
         th4URApv5TguGppbR1xAlGqH0FO8nxO9uzFDVTuAJqg54ifE63likA6Y21uJqC86C15r
         2cnw==
X-Forwarded-Encrypted: i=1; AHgh+RqhWyG5F4/e/cLXNU7ak3mCib9iwdfEUScUmR4LHMSEzg9eB77ih407AuSy8r/B06clmTC47t6n04SlH6Pm@vger.kernel.org
X-Gm-Message-State: AFuF++lc3fg7HD9dpks0DtmRdBl98aSzgD0sXKiG28TgJ20a1ZBLkNer
	lKvjntbI9qEV20zwVHEi8RPpZlZ+FlKBMwqUdwR73VTe2jFKjZkvR36rkQhp0/X3p0KQfFVeKWw
	8gEsN9huoxMbzZC2R2wgxzjVYKeRTqYgq6Q4ij4urZPQSS9Pu5P8JUN1bbfgrIFD4u9xr
X-Gm-Gg: AR+sD12xXp4ObJ1O9iDGqiVkFpEE/mSEo25sChgxuCEB98AA8ILxTn+kka/eg13SYvj
	5gfUqOvfKcw8yGRkp17MwgoMeHHqsP09kstpUfLhWyi+9XybsZUV9wMBRpxN22POt0Xq55rUUps
	aZbehUuHs6/ubB9aLD1dbpSb6ZPTeDWM6BQ95yN31nrwXk/kkrwk3btgeHxaiDhRO9dlw5N3Tfs
	mQW0T644GiewSqXEhED1jP5uAMZbMU4SJGNQ6ra7JOcJ0eHlO4IGhx/sD5SIQaGvaYTMMGyFPlh
	u6wneIdkPh043PGFjY6B3M25AwtIN9+NmQxr9bYk8Nw9yG9B02PnOQQOJLIUcbFOqdFw1IrYGAu
	JdNwi1pUVIERW4A==
X-Received: by 2002:a05:620a:319d:b0:937:45fb:6b95 with SMTP id af79cd13be357-93947fe52e2mr1038443485a.17.1788265365772;
        Tue, 01 Sep 2026 05:22:45 -0700 (PDT)
X-Received: by 2002:a05:620a:319d:b0:937:45fb:6b95 with SMTP id af79cd13be357-93947fe52e2mr1038429185a.17.1788265364948;
        Tue, 01 Sep 2026 05:22:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm57938805e9.10.2026.09.01.05.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:22:43 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:22:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: m31: propagate reset errors
Message-ID: <f2jjxkjwmgwxl3fgjlwdpjgjzisj6xweatqu5klvlcjgwstflu@cbxmjvgvejuy>
References: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96c396 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Eo94fBGS1rxZ-i0BCloA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMCBTYWx0ZWRfX2acSMy5M9Kz2
 zejtpCpkxLINcS86pkZG7Z2CbeIMO+K17Y61K9cHW1mPA6Ddie1amryCCHXIEjA2d13Q/WEUFUF
 i8ooJTSFo0C+hfNppZS11SS8oscqTWrgWIxxNEHoRlePUSY/MgkNefqlRzYsHieBfNjSfwEEYhX
 rLwAKojadpH6d5yQDW5y0XFDpYQvRtsJoYxoKWgAHbprMuHT68DxKVvyCES2Xkp2+WZHvbk2vZi
 fQl3RMm7QESnZzbW7s9stDMfTPCl+pJf+oth1Y9VINP9DcI/XzoG8GYaOFTuakP6ZcaaPytsoki
 pJQJ2WlG7PIN588pGHZooGEqTCTQNFXffCMOqEwcRhPghPxLpj4F0K8sW/En9a1O8jYsEMqO+R4
 AYH/o8lr2tK0vcRsAoOPyI3hBuR5gnPmXpmeZliWYKNi3pzZuBY932GxoIpkOFgohXd9xWik3aD
 plqMUtun/4n46kYEGhg==
X-Proofpoint-GUID: A8KkB-bJPvPsiG3nfd-rie37iQ_8HaUp
X-Proofpoint-ORIG-GUID: A8KkB-bJPvPsiG3nfd-rie37iQ_8HaUp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMCBTYWx0ZWRfX/VFAcG2Zj9u5
 2iFR7qkf1Nn/viK3YImgqIcRvd70Kw4wzAj2qBRNu08V/m10CqjYpR/PdXYo33TSZTrllLpkJpF
 wElkUij0eP8l9YNZOVaV+wL156lGMgI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010110

On 26-08-30 21:14:42, Pengpeng Hou wrote:
> m31usb_phy_init() enables the regulator and clock, then performs an
> unchecked
> reset pulse before reporting that the PHY powered on.
> 
> Return reset-controller errors and release the clock and regulator that
> were
> enabled for the failed power-on attempt.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
