Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516152;
	b=sfWcqM0Nqt7CuUrDQqEMU6+VLyuLolJCWl/NZa8c5XDSgkZ4eZJkrPZX9Ujm1gIKk/o4
	 vZyezLVzjM5NTj0cu5fMdraPYsjjLDiVB953gn+58pge/Mra6jURDUHhXitSQODgbUO9O
	 vyznkRSkqc6wky+5T29TWTi0LOkvbZhsHcXwt5GW2S5uVrzOZVfKcx+vA6rfqzDXk4as8
	 PShQIcuRHFyffwnMjQofIVTlhW/EZpS6bO5LS4PIL+6KfqI2GLWs9cVsplhVYoxEjzXdt
	 XZ8cWv1mvBS50Z1TqfkDrAgUElqnoj5BD1Dbp9HM8qlIrNfvVDN+l0Y0F2vwpIHGimg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
	b=t2wiY01jkg60xBv9NeyPpdrYLk3b5SFTGnz1a7F04E+anTx837cVlDdZ4V8VFonKcY/1
	 NozO6qG83oPVQrAtTjysUOEoGrf2HP35K79wjHVvQNhwRU12vbZcTVzM6UI47iJE2eMvp
	 ffqH5khxkcf3x+X8YygQhFJXtYPAU/N6Tw7DIvTiJbpxk5UCGbRzBh2MhKpD41dOxnMVv
	 x8YiCwTX9PIj08AZrzNuWX66/iPCPFUVKAiiULnHSTOW/m9gRf61tTNq7ComrVSgxpORd
	 1kM9QM8oTPod8csfh0NvcxZUAL2/R4dfmlpDfJxsFbX6xwoGZ6ORmPulHtdRHbKK1AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8ZdrZYR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNjrsOkr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953C2606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 953C2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8ZdrZYR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNjrsOkr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Vshr1598316
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=isq1BtOcwaV6k1B+5U1NnLpl
	dAIjmTJ+TO6ciHLOLmM=; b=N8ZdrZYRTl7zB7gP1LKPgniw4ZznMWPBcr9GFT0b
	Fe7H8LGIZ2nxbS2jaRVVul26B1IIWYrp1UDJnoMDfToiE8DB6f7Ru0XuZdlDvUfI
	qmyIoHdn1WpjbECp4HFRlQTpu6qPZzQvZjUspEg55oIbpQE6bCjagm+1/STBLkjL
	MwDHhiS552nWzqet2sREks0dEbIHSqN96XgBjLfoSQfLsuta94wTN5rXAE6Zyz9d
	YloTWHdLEz5J0KSBPpFxtjs95IM09Snf95YNf9grOlz0Qheo5v399rIP/qQXFXpa
	gCSILi3XOSXEmgV/uhNLO8rBshCJc6mr2HBxa1hKRN0k3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqk4uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:29:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38531c1a566so3539921eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516149; x=1796120949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
        b=hNjrsOkrhyg8w6IsDeNIS4R2yEAEn0IfJDnenSIHrM4MxqZ/y8mRnvqpMx7Co2bMr+
         rjm57sGk0W2Nd3FDGHM5fMnLMi12PtZx6iWww7R3OEj+uV0QcVhTCKmTr+9YT6DBzvEg
         /AzEpEU6M2fSp8I7wx5HKnIbYDJQ2n2flN7pvM47+8mVvVYQQoG7muxxaauW3KEF+uKV
         ca7X43dQN972Aa81jinX//IQnhbKT/VltLv6If4QP5DpUnDVxaEeVNV3RHKDMXhSfI2n
         M+7MsKI5yEj+xcHX6Q2oZtHUpp/wOoaPjndFTkCU4xabPU4XAgAw5eY0cTGbOvjkbQRj
         wxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516149; x=1796120949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
        b=KKNLEujjbor/dYm6Tr+/Om+mm8pQO2HvvvB58sazWXPM5LKNswIIdE/uMVCWCoqWCG
         +cYtnLFLezmxaICikv/TmbyYoAANCCgHRqkmRqRIMDdi9d4NhxdlWQNqBMyISFJMiGrl
         YjrfJtfbM3SpihpDR3+8+DNTYd55nkAf4vSG0Lr4pWt1k8B3gjf8p1XJ240NSSUA3CXf
         n/ZzqUZ7b0FZVvI3tjrWtB8m9ER5JaM8oT5Zv/i6RhPAJYOHlCwUAa+206Xsx+G5pzm4
         cMgdh8HK6XDAaqM8k7CeKiFnu4/q3Koh+HLkKgjh5faMMICigSbvMQ2R0TI4snM8p3vN
         kJ5A==
X-Forwarded-Encrypted: i=1; AL+hErFW1pvce+nN+g3iO/ltP4vP7FRH2QJChPaHjQXEoOFFNjJUvGB4eejnQ2VzGwKLTiQHKEy+LeOd4WkZSH+b@vger.kernel.org
X-Gm-Message-State: APuU4Z9CD45684yiAoZUJCovoCuegymTeUWSopHI68Ak4/bc/qVBJu8J
	bODvrbn+bgWWhCYkkknuBP3PPnmIMJw9v6RMUfZz1JkJCS69FtTlo+jrKgy+VigKU6HUWkBAD9F
	2467jGOsFdUjefe4a7/U2I3Oxs8bs/zPu4UECuylCHPWkKk2stm9TCa7uu6osRgVgmak6
X-Gm-Gg: AZFdTZeQEzqvc3bLmY0NWPJuOi9xXTM2cRkzarZldGRLSJywAtHzR29JnA3t2ukfVvT
	P/jWyGuFATmRuJZps8ouAmtGYzyETbV4XlGI4D1ddBVhq5nRNoc3/YUGz6GK0EXdVnZAL9dSY5l
	Amrr51jWdXY5oFglaQDuNBYUXyvtLWs1/sUmdKiGwaLpBSVI+dbSxJPjkCKy26m3bqVTksJhtOR
	chTHNxW805tY9ru1T7HBD0SAvXISttMtpAIRSbuV2/+WHBSewB6m0VHk437bAWilZfI4PjSm/Bt
	lFXallSI0kCGz3EU91e9A5D7bLEE/G+05H+VqnwSzlLnyfsrrI4fKLWHjkjjf1cVDmMe86WDwE6
	Qn8aZ6EJj39gbiaH8WAxsSE0RQ2ZjCMzBrcXXIzjb1vNaqDjKH2rLSs0Vb0V9WXQ4DTn7QAQlgK
	Id
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr11227806eec.20.1795516149099;
        Tue, 24 Nov 2026 02:29:09 -0800 (PST)
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr11227771eec.20.1795516148444;
        Tue, 24 Nov 2026 02:29:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm46045074eec.6.2026.11.24.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:29:07 -0800 (PST)
Date: Tue, 24 Nov 2026 15:58:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Message-ID: <20261124102859.s6wr5l2ta3sne7ci@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0566f6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wRyLKtKWvOkyam-9G8YA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX56J09FeQuKYC
 s1FB/ZHXxL5JZvLzF4phtEzzDaMm2ZP+M8qNxAT1Sbl4bCTFvM5WeXAh+GJJvqssnaS2cP37yQR
 e3p738qholhbtplZaR8n7PE5q/EMxr51jpKCJ2dVWHVFVcFUKvhjhNRS5i+s/Va95SpVlwlEDas
 xRe/Qt/QYO2+S8f61B5MWI+UEv396FjJFYPvbzH0eNY7egiZ9jN77BsJ12ZVj6+5P16jKgbZQDA
 MXOsXkMOwFsyWZVfXiCgwDqsCZ+agej2KoAS0RIazjvBL5ZjwDXBmAYB3vM1pp6+HlHFBk0H7Er
 KIpWTM0Fih4uXIsMTimZP2iZtRv2tGC/r/R77kIgO/xEl/o93IQLG+gk6XJuPa9cdopUjNH4xW9
 lE+dbi3xmnNAr8hTiaO0Xr/OFD5QvWfW4ZrqhMRTJhDjjPsPysMyTv4koTn+zmvsxWDis3uPxA1
 yqfq4/xCULk1QCp3gUA==
X-Proofpoint-GUID: ae2qOijJspBzYT_dn64FXBUGq0_HHZLF
X-Proofpoint-ORIG-GUID: ae2qOijJspBzYT_dn64FXBUGq0_HHZLF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX8YmtgcTU125K
 60bQI/7vXc2WvIZlpLZ0XEOv1E9ClmbupDn2nVjpQSku+0TlO2HzPwIzsq24bmc5g9ksCKWgJ4K
 FDN+a5yA08YVB1jzLy/vrN+jeMs86oI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Fri, Nov 20, 2026 at 06:50:52PM +0530, Komal Bajaj wrote:
> All existing Shikra board variants boot Linux under the Gunyah
> hypervisor, with Linux running at EL1. Linux can also be booted
> directly at EL2 on these devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote
> processor firmware in the DeviceTree consumed by Linux. Also
> disable GPU zap shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the Shikra CQM, CQS and
> IQS EVK variants to produce -el2.dtb artifacts alongside the standard
> DTBs.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
