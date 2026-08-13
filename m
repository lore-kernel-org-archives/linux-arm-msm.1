Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70548EBC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635511; cv=none; b=vE0+D6XiLH5M/FwfCJDs/7Esg8Eb0UjoIujmQZCgtLPUi40Yt9oLCu1lLIZegTDrvggGFZaYPGblCSJuQf+a7btGgmUDM4ZS+/UTyf5QsrfQEqM0pxe3gxAemUbUwn3YTFY4BjXEAJrgQiGQbZMhIazZ9+uyU1NKDUSR2+Mw/ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635511; c=relaxed/simple;
	bh=YDKpocMpUCcnLMlTC1bm9pWso+XkL3DB+FwfnhNpVbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrHNAkRwl+AWBbyTXTP8hXC7NZ4X0mSYO4MLRRC3p9fIeAJD6sOO9VZydMtTP0nALo5R94jg/kFNCphNAJOxs8dDGjIXYAHD0GDL82UVjZyhKAzl25Rehg/6IEWw0Tsy2qMyLzK+xi0CqGsIABb+bZfUZiqdUGsRJJcPzojk99g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCGyjBFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QG6/5iR7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCGyjBFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QG6/5iR7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTHr72778265
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=81QTck7ToasER/Cqp4PaOmSG
	5GxMRtjJiad/1RRYt/g=; b=GCGyjBFwS65JI3QdNm+vcRFXkbQQmRDOdTx1mYWI
	VO8WrPsXsBvlhxFLgpKPtyEoZfSktm6hI6cDI9A6yJvr0wx0LSsxiGfr/cboFcyT
	wYOoK6pBuki8WfOdjmkZOFBaC47+I46hrn2QYU+cOQyP+Zi4psUfuLSNzCN4sZs5
	Iuie6SfX+KoNd/kx0nYm3M7S08JBJ+U9nmtzhFLs4PUGtctQi6Yh1nE7GvXeXMhe
	LBku8Gd6PtMvEhEwEpcmkSEGRBwO8+7cAj8EAL+dHy9pX5vWcsmwnCjR6BcVkrc9
	B8AoL7YehE0L/MYIO1qgYY8zCOZgdYOkNUuZXN3qrnxmcg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5h9ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 15:38:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so525961cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786635502; x=1787240302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=81QTck7ToasER/Cqp4PaOmSG5GxMRtjJiad/1RRYt/g=;
        b=QG6/5iR7HbhjOBvDWiBFO1YIcgtSrHOFVkxRPFoD2y0imRxhAhoR9RP1Da7PWJirqF
         hQro0vT5GjbOft0Fu3tCZQwKN7wyctKjFq4406gnU9XaZ+WjsnbaRCbrXHT0d6hNO9qj
         oVf359ehcCJlgzVmR6cPItLxKfY5yb5BCrYDYg3imITZr+p1HwfFLs5QJ433m0v8b2VY
         goq8dsjCnNt5ROFtSZp+d+uTQKAHQGlY2QX7Y7zX7ZHTe9B3h1eDaWZxx1rgQTMNmPQ2
         UD2m/VwVUDcVlLiRs+qKF7e9D8BiC1CHgxuadDEiqonQqXhnNRXqJHUkmyxKNEK/Rpil
         CNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635502; x=1787240302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81QTck7ToasER/Cqp4PaOmSG5GxMRtjJiad/1RRYt/g=;
        b=H8D4xF4Ut0QpUJu7xcIbxQXas2zRtgBtWSCkNvQ66adTzss/ZIfVpa5k8FG/pMlWFg
         LTPD2yGUyzrJZL9ih8nju3Zj/p+beALeZeTXFwnJc+0/m8iE9uKlyMnt4AQhHviQwvLj
         6q9irq2M/a/pNZRlnUJALY6Ohqf0IhQMYpDeIGci2urEGcPl82ZMmW0wVD6JJiZdqsS7
         C6G+8bb6lMLlcdNlno/isaJOTS/czK0yy8cKi3d4mKf0dFo0Kz7R8oGeAvCNWN5h4mj6
         LQ/LLfA4+6q9Ypqp5RhzoD94OutS4wGmp1dwPEgcW8fmtAt7iR7Th7gXx3LUaAomlo7m
         18LA==
X-Forwarded-Encrypted: i=1; AHgh+RpR7pBy71B3OkKymfV2I+nm8K8JmFMOQtiZSZ5xYSmJxmx8+TuuTLF2J1Ti0BsfTAIeZOHMeOLAAofwk0U2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9g6eMAkDa/qSixkxsoO/L5sASmIi3WDX3B0vZEK4KRQu7IPdf
	9sK5fYDsoezyjKyfVpMFiwfGHoPMQtCmNVf1QnppH/xpl/8aDLdHDe2XV0EzLC6SPPcVzVEE5M0
	obbkdfYVeRelbTu/ve2CcQPdfAzZMxWK2qJAKjkgl/SB7022Bu1Y+VWqsv2qapSTEsY3+
X-Gm-Gg: AR+sD10NCSpK6sMuJvIiVrBFW9MuROep30KrMLuJUilFuZFb0Ya5DWf/4s5oHdiP7+Y
	3g4cBKpifnu7NoRWyDZSMTDDyAluzhbcKjm3xP9uKZjq+fzAiIV+g5HQNdcp53oyqiy1+gBMsup
	L8gWe6rK8MpM6A4W2PnuVXryGyvc0g3bkZ4Fsp9oS4qDR+8VIbEDJX3RJQC7PsSIjohK3tUbhyl
	zG3/4bnZ0fLoqAPWJSwVPXvJkBRngSekyIJ8B+J0MR9CVU+6Zj2loaN1mFbqHnOrS8cZG/1hHRo
	VbCt/pgs0W4pXetfE1YG+q32c+bPmUgwVpmdIrq9Yuytk7a+KGCn4NhlmM9NiAPgNP9Q/Vop5C7
	7vI70KxQs8GtG1PoPRXzNiQjPpHvdBIb6h+yo/C+SgCbqiN6YYpbe9ywrxYOjFUKNjhIs2AnS3s
	Klh2n3vijxamtF
X-Received: by 2002:a05:622a:1a9b:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52d73e3c8a6mr63096961cf.40.1786635502204;
        Thu, 13 Aug 2026 08:38:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9b:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52d73e3c8a6mr63095941cf.40.1786635501601;
        Thu, 13 Aug 2026 08:38:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cdb8afsm281261fa.22.2026.08.13.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:38:20 -0700 (PDT)
Date: Thu, 13 Aug 2026 18:38:18 +0300
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
Subject: Re: [PATCH v2 09/14] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
Message-ID: <x6vh4vejt4ercdvfhbfgq7ca2nd5fhvgkp33gkztedthugfeon@o3eco25qtbap>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
X-Proofpoint-ORIG-GUID: K6GkbfhgM7icWn6UxkPKaJA6vjuaWWhD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX+/jH2N9fqDf8
 mT8wQNwb9x2FIMsruBHsVNphcz9hGMwOJijwNZdBrL2cIaj9gt+FViALmugez7icLYNd5KIjBM+
 SjeW9QNHUTlE5fX0bgdy/Grm0pWLscU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX7i348zeICwux
 /8B08Bm8xkKo17irKxTSif+AalkmWQhoDqVMeg4AUGrJNDZtWV/eByOvho1Ce9ePnI54eaD/a4k
 5LQ7kGbY9hiRyQIzpYPKzA5bBL1JDNspjOgWGa56yYDBqUOWGbGzaVajK+aO6UO1vfEWcNL2ec8
 c9wk/8sfZbKF9NNP59KeMV01KNtTsPWk+QlER+yx+50S2WdNOOn2HdWiGilkWdd6KnTGoVKjxxl
 HbaFGRFAELSf8ZAfDw4FGca7eH9/5y/xrg/Jd9wbNfUFlR6qaPuV6JcIkUQujUI1JdoPHhwo9m/
 r/FtgTF0REd86pctBTAXkmT4Kv7/wFBgfTGPI9TXQbvwBL4dFxPTtdq6ayMHE3jj3WUZ0q8PBYg
 c9Dd31mtqGcgyPJVBIQ7P5uhaveuDLyAsPulZMvhzE3VAvlHUsMRvaafz+3AejOB8rXC60BMDa0
 FdSlHBiI6t+Po8wuEIg==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7de4ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=okkz_DIgOYwYE9KhFHQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: K6GkbfhgM7icWn6UxkPKaJA6vjuaWWhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130112

On Wed, Aug 12, 2026 at 01:34:44PM +0400, George Moussalem wrote:
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> These clocks are required for USB3 mode only and are not needed for USB2
> mode.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
