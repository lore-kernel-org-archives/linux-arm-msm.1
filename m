Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF373630B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908248; cv=none; b=oCDLyZ09exxXDte5ycgFAfwYlp1Fge1lc+zKXJIHCOzCaAYj7hfGodhC/nI2fx0r9tUuq7SRgZ4Kunl3tecISEp2n5iX17ZKsEqF9BuB8Dn5EnSaqxJhR9+f+Vq1jaEzWVZndvc/8LTX0hbxL0urybMQd32FJd07OsH3sG1OhrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908248; c=relaxed/simple;
	bh=H1wc9vGVsGCeG48/JExdFPP0oJJqqWCSm2PIC2HdVTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1SS+iVighjdFrVjQeLGo6Xc4mfZAEENT3n76GoYl2oz4H9rgNKq6uBupRXnAP4dt5TwbaS4NPYbAZS/T+TafdRit8XbKHX12dmQsm/TGjoVqT2RCgWGxEviBFubOSDmoEKxIS+lTVwfvK1KurMeE4sN+DH7/fvqGMw/Iz+ub4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hC6EVB1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfqyWIuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hC6EVB1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfqyWIuX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBQo3344426
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=; b=hC6EVB1YB052qg1j
	JzfLHBn+EON/IJbaqOMREWXDflpiA2k+S3WSfUrz99Ej1ceiZ7pf0zpdJ1nrLHPt
	SqsXNwxX+2UpKDK0FagHmQFG1CWRNbfKXMwm+MIPwQ5dhQZ8/OhSzehG3fDFUBUD
	UKly15G9psdj8ykoAHbHzr+hJn/FecvmnVbiQFzXJ3KqaptvwQoBZx3opBf2LITv
	CZzqf+z/9F8Z5Zk3llr6EKyzY4YUG2VZoFqJEc7BzEdCMdJAtTDZNTvezmrhwu8c
	dtnGDa7bGER6+1p6OFcpf/GtxNfpiHlKOPOAn8HLovSzx45N+gVcTNZlnAR1zf+i
	3Syxlg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0ppp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:50:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so375741cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784908246; x=1785513046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=;
        b=hfqyWIuXpPDxgbW/Zn/67IoJER9dvXKvbpL1l9uL7FBtheVauAwk8HP0qMH6EOu2ZM
         K4N2ePkJo/u3efxesczbAJpL9OvKuUIj26ry4j1A5J3jEx6gphR82m+E5DlSwxSD+C4V
         rj4jwRWkhUs/EfeQvH8p5PWXG6pItCOLwN+l8TKquF1RJ3EtcxO+LcKq2yWCIoRUuE9b
         TarNkhVEvOW8GwGNaY7pEnKo61sB4n+8/eFhmjNiprWfLQcot9n7XdtKmn4zRsKYQ7ii
         mpc4lYBjxwkkxE/WRkJhoVghVpfUigxEkS2hOPdx/9vDFizp339mHe0+jDZ4cw8IOwU5
         RUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908246; x=1785513046;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsLrz+AUtIAsWpyhnYd38/0R5o2hWRM61PfRwNfUs84=;
        b=EtpONRFYdge7vhi5Wyu4HWTcxkHMUxUo6ihv613QyLLWmPuBoYKQ1gzmSyt4h3UWbR
         pGyD/Q4v4+zeasjW+GExRu01L4W4fw8Bz2WG0/6IdcPQ7bKXvT6Erwy9oPzEnxY4wCbN
         CcKvochHyk3oUbK3H9t1rVbWExFHcXYGWB37VZCl2CWbd02SEeom/I4wMRtaiWQwpWXA
         iXbspO9Gu/hT9C9miP1o7aSh4ITEllkX1zhD10B4MtWzcp5E7wfZHrsU4ST/6jG8TOn1
         GCW+ag5qPwJzirKU/eZQT1WnXu2nrbWzdPEt8V7Sn7UyeVGspMJ76AgVrpPeHfSB8gD4
         LzMQ==
X-Gm-Message-State: AOJu0YyNrGHazk6Ud6aOdZGM4yY6Lz8BXnlizlxhlfi1SNBPzI8VYxk5
	YhRZjvHUgCTCyKQ0N2hmmzypiCYmg8NHbI0QhXBWHdsuJMcWfglqPmHdPxKM6As6dLPzBlDxGyQ
	oPCGQfdI5ZrzcdpHYFMVbriJ87ojDWY0MVJvgkoABQWT4ANHhK5ePRVX8g6re2su90NCb
X-Gm-Gg: AR+sD1134MnJDVeSkrYLBXoTvzufQ0VHqHNt+8DZtuHjCUCveEn7AHogZHCxiuSsqpO
	t9Ym/FGYbzu05odTN80CRLs8dWyAWrOTnSvJoTuTqQxmU/cs3/xaxEvubVNXSX+PFHB0g6xfP3D
	6ms+woRC0HHhjW7BxUTJ97G/QeO2sgS6A//qgORNnFRJJRag/Hem9K79W6DbRE9LehPWf/t+ejL
	g0j2RlhiHgDSzB2X+WXZHBnFZvmMXOTZBs+frL9GldHA3G7sk8lWDsG9mapyFfX8dC8uLnlxW2p
	l1luYUM8CPSfzIrP5rayg1phBtBbWSkoQFKuGQ/p5nxIA9drw6lJxF1T113yljXLd3NvmHVspZU
	1S0Y7TzvbpodZy3Y2jcSmHurx
X-Received: by 2002:ac8:614b:0:10b0:51c:857f:9c1c with SMTP id d75a77b69052e-5283dff23f2mr45688291cf.11.1784908245601;
        Fri, 24 Jul 2026 08:50:45 -0700 (PDT)
X-Received: by 2002:ac8:614b:0:10b0:51c:857f:9c1c with SMTP id d75a77b69052e-5283dff23f2mr45688121cf.11.1784908245047;
        Fri, 24 Jul 2026 08:50:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f8fb1sm7929e87.72.2026.07.24.08.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 08:50:44 -0700 (PDT)
Message-ID: <bc845149-2a19-430f-9768-3443b10c0c65@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:50:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-1-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfX5r+JOKltDAKG
 Jr9nW9HPX94i0pWk8TBkKmD76xny+LdWdA3AxF2SC1373drhICd/b0mUFN1KaE4LD8R3OXFvtTV
 6o6Aeyb1hjoAt7rz9ngOUi6NjQOxUuE=
X-Proofpoint-GUID: ybFHKMILbCiQeM-g-4QBhxiLfPZyMbr4
X-Proofpoint-ORIG-GUID: ybFHKMILbCiQeM-g-4QBhxiLfPZyMbr4
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a6389d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C_jcV2f4aFh2m0BU-kAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfXx+ey2dK4sKCS
 VzXSJn4qdNx+KHaMxtLMKJDPhzYDsKtusPQC2EUkNd2PKDBpOjEwCunVmb/XGNFN9uO04Umvujj
 SfTRBUoGs35M271K/T6QeL2vVQUPOXQqrYlV7qsbmxCtifuD5J5+/ZZzvkLw/jGHRFpGEfrd9Cb
 0E6BEwe9vbLLK0flETf3BE+LCERlCZ/rWk7W69kYDWm/KJtsdvbHNdW5bbMTUzsQSdphaZ4p4HG
 YFG4r/XLOkIFFHApaPA68bTUjK4vzvOhXz+Zltr1nAT+hRyQs0jIbbKmxf1DUa9hrtwMZvmOGVV
 q1CLdn/zZGAOdfv6boQ5uy1DqIjRuHOsd0T7dA3WZbA+T4J+Skbre8sRJbN6mQtFjXpC9Fhc5zf
 IECx9E1/ztEKGBGYVAsVTaPx3icFEuZIJ4F88ycU8FBo4bc+c2QPggGPWmFatP2i+e1pXzfF8+l
 kQdniULTQkLIUp0Wy4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240142

On 7/24/26 5:00 PM, Luo Jie wrote:
> Replace clk_hw_register_fixed_rate_parent_hw() with the managed
> devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
> clocks are automatically unregistered when the device is unbound.
> 
> Since all clocks in the driver are now registered via devm_ variants,
> the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
> 'unregister_fixed_clk' error-path loop are no longer needed and are
> removed.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
