Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B72348CD46
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635501; cv=none; b=aZf527y8s2YEdj3OUaDUpPA7sInWdG5228SCc+Gcn3oEgICmR4oPJ8tdauOE/hrNuF0w2RpEJQBfrhJ4TT2T/uF6TYLk35XANpAU4LbQcT4z8GgSv8M1pLOBvN9vqb14CxnyE1pzOWIEMZwwzKlxEq7XHvodmNcHZdnPSQKMIig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635501; c=relaxed/simple;
	bh=+UccSeJlO0loZSK/eH8DMP1/5s7t4faZKMDsRTcReC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK0YHP5x8o710EwrLXHWx7LmsnjudzsmlKn+UaduUBK02c4t21s/28hykd0WpAg5WvdsRkX13EvfOKAgBgO7y5N60L9gPUSos5+lRVfKiCFKVfg0WvXGSdcz47Aj3x1sxQffSPfJDj2lbX2WNZFEtptGxVMc0qOmkouyzDfbOVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+aYcNPp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvB0nQtV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+aYcNPp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvB0nQtV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTJjX2778269
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Z+8TPPRz/0BEaS0dGmL/mci
	2zflTsU1Bc4aBxXGWSE=; b=g+aYcNPpxIWs/oJJ0iCejJakXeLzxdBdRG12jvMh
	argp1tvJHacVB5XZz3z5BLhlTizXR2vhaqycVmwEPP9Waogv4QuVA5csDPJpPLYx
	PIafcPe5N0WFyCLqROGpo1/NZ6MCmI3LJ03mxcxvj3lox5vOQXdBvnQcTTBPM8Bl
	a+FZoL+NsdoH3gxuv/uhMGCG+82Zo7nJs5nInVwTTrJ94rP6fkAZ/021CMu0l5Pz
	MJ9GHQvRTMsKCdamXCqkZ/fmqYYYDrvQfRlcnr2EVPR+MrDWm897sCQa1ULNI1AI
	8fCtJtkbmXoGOSmT9M4QnxQFFTgvbV30H4/t4KKv1vdOag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5h9bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:38:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso860771cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786635492; x=1787240292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Z+8TPPRz/0BEaS0dGmL/mci2zflTsU1Bc4aBxXGWSE=;
        b=KvB0nQtVg4pO9gyXeYStZgsL8bGgNaaz3saz3woGS/RezwCthOfrdw+sU1HHEb+KLn
         9iLVl+K35aFVk1YTSM5o4MpxsZ2PIS29Cx6BfMN26N0B9auYJ3qEzFqBs7tKJIcTOQTv
         xds76EfzjBFMONPCLgN+DJat/e35tgTGj8peD0SC/P9SGvxWsxpzYufDwbGQgtwkG3AC
         o3h4WZ9Lf36Nabm5E6JzpZE+L8HxbHi47Yc5d6rObBa4mbBO1jHi2UFnX6lzqki1IKgQ
         MEBmFY+UXVQu2VZQRuuAxGI/f5DPqDLX4JXduweMVtCu7DJ5l8oIhtYea9PlY7LzjN4/
         SY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635492; x=1787240292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Z+8TPPRz/0BEaS0dGmL/mci2zflTsU1Bc4aBxXGWSE=;
        b=p7OoBhx2rYid0AKL10LTQ6Zv/fBSt3K2mUR0UgCbubrjBy4WjCDFSro8zEsOU11DPf
         N9de6Gm4lb18Zrna9kGL3kFSXVD6fYQSYqNK0ayEfLW/0Bi+ttSCoYBiu56k+zOEoM8m
         2mdiO8vEcXAseI6lvPr+S/n9aTmUfzxAmMtJLi2RTLkUCPaXPbWbUygi+HfmG/2Y+bg1
         gh9YD0eBTnXuWRNeQIEKlpC6mpwIPyaJgR7Gcv6T8M2ZpghX5G2SJBma78pfsHHbDEKD
         luhRXgguRb8fB8IRAVrZwRUYdz2qHOgcltQVHSUpDylQBKDCuKj0Veqt4qPNuuy5I2s0
         VEfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9iINGexs6+tepggCfeMlpLOv71nW4ciyncUfmThF44x0NRF0DftLX6ichri9k7EQPNMLPRM/jRqBvigNd@vger.kernel.org
X-Gm-Message-State: AOJu0YwXbuxO6nT+UCmLP22TMN5pHqY1oeF9dk3cA6sLmspIvO5KNant
	8M5A7wp6mUW/I2Vjalwp8xqvklTPBWYR4feGMwrLM2EqbPgfGuLZknlwWJ5FpJpueFmRs8MJdy1
	men5OLs8JRPujqQwUL6nfuA41NyhYb08MwdgYwv4CUDVDFpuqmpAHzimL1qD4w65TCl2C
X-Gm-Gg: AR+sD13HqJOTf0i8jJZ7FUFu54BJC4eFP8T0vx2cEGhdaoqsLqpPwlsKQpg/L0o8PQz
	4Jykxbp5eIjHmbskKWXC7RS+z66xpjYKuORymaf9ZiKcJM3bp5rrH35N6oQFTdqHsCBdAiLgvOk
	Z/OFStuI48Gc/mn5X8S3Pj/mnV5tkwUfQvgulMlAHV+kl4BDF5uPV5/kfT9hJxK6/+p9hxBdZRU
	kfsnzgyuITO4aG8LDbhyfKmILArcfuMWCzlu40TCKzVZHtRDpIolAbvpcpwusBffSR7zSlg5+IT
	HaAJHbhBZXnVfo6ZxUyDegPgRvY4xCmNibt5dvFNVgDQy4wS/RMH9wkiHOAT6UMYg2niSx3RDfI
	v1wCUkaiB33ZAWnXirgv1bjAQ9Ag9oRly1EURvm6kM483dpPo6VBfk6878RM6ZyGpI8TIwYnrTS
	PfYYQcfaZKbrO9
X-Received: by 2002:a05:622a:1106:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52d73be0ed5mr63315521cf.4.1786635492132;
        Thu, 13 Aug 2026 08:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1106:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52d73be0ed5mr63314781cf.4.1786635491629;
        Thu, 13 Aug 2026 08:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458419613sm64708e87.62.2026.08.13.08.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:38:10 -0700 (PDT)
Date: Thu, 13 Aug 2026 18:38:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 08/14] arm64: dts: qcom: ipq5332: Add clocks required
 for USB3 support
Message-ID: <5dh3s4dbpynj3tbe5ivmsq5qjnjztmzpmbj2m5whmi43qlae5a@w6flmrikrked>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
X-Proofpoint-ORIG-GUID: SAah36-8Hvhoj9yqFP7F-VsPz3Qyzwr7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX64z1XKVavpw4
 c8le+ka4CDMLZyQr4OO//Jlgql+5+KJHGGjCgsvvKSYcoQP3p0mKprcLKHpBNsJqiwYiz1TTulf
 tY/Qx/w+CdTeqY9Gy6A+laY7IhqIElQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX1IYEh3gaoD2a
 vx/OCE9NS8h5+QxC8MRaNR5o13N2DwAW7t4QBxCQpP62pBh6GjiupLo42wTsbSYEDsmQamxKQX/
 k1Krrw3mOaCOODeZFwWDbjo8RwaLAe7GGecukOzrwC4gLsWuW6YOOeuOgZezXYJt0Zp8f2EZRHO
 2iK3+G0aZO+5aTEjlE2p/540o7BXUl2eIH5aMgz9GaaI4fKcvmjlTIjFcTpKXDCnI4ID7QUeXm9
 w5LQo7+fQtgaY1ivrjw0/uwOuegz8nkFIxGHvAhQRS0taZvr5Sd2yXBFANA/jcHErf+qnkm5eyC
 1W9jF0Hldq0G+SetYi69QT8Qj0mROjQBjRptKdPv8YPWz/eozikMPG6ArzAi2XnnlL6bA3YcbD4
 7I9DcSEF2qWWwJubUdaUn396BiMI2MQfkVnQzbE+PQYS2N7W1UDvp0YLx03ohLPu0c8pfha5VOE
 80PhtYKgyfpySCx/8/w==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7de4e5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=TbTMhDWFNTfgXYAo_YsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SAah36-8Hvhoj9yqFP7F-VsPz3Qyzwr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130112

On Wed, Aug 12, 2026 at 01:34:43PM +0400, George Moussalem wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
