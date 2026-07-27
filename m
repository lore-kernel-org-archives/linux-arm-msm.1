Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2013D3486
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160585; cv=none; b=PpnYo8y8L1zLfNyA/MEydwSajK1GFnk/kM1tADVplj7i+dynnB9Rd/HATO3nG9vAepOWQ3Viban5x+Rq34Zn5EXN1ZMKSWRlcJbv0oOvc9DgfaDqpEQhehKI9uu0oMerChkHJTOU+gx1zO5oHMqGyRnk9Y5021Ft30SZgu1LR3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160585; c=relaxed/simple;
	bh=qA326r5sqZxYVFdkUlp/oF9J4KEqqBGpbD0f1T+3rf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs4J7IQu9EQ+zfgnD/sISCuaKsWEb75WPLjuxXJ/6deVW38r92aqHkdS0qPpJFZe7UTpdnLb+6n87uhSWjBrmDYsJ2/ksbDDd+xLd6/5kCoSJjmq21pjNhwY1fwnEsx+TfDw4nISqulRZR8q2f49GUu1P5zMTU3sUpTRyR8ARf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1hzPGYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpni96Rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1hzPGYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpni96Rh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlYcb4115053
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XEdThMl9wB0HUHCapGlOKYIA
	ukDNxU4aWNkFOAojSDU=; b=g1hzPGYB160xdVffc+FN+nhqdoD2S9y4lo66GNym
	g814L44HzLD9Unab1F4KdsqZuIEHoNb0Xb/Qidmg0IJvMXzneA+Ha3YK/BXbpWDF
	zMWNimzhe+y8ygHKm7OIR2Y+HZQ8TJDHlFXJyXq31LT1pxAhhIavcxpZGpv9gJxv
	gkCx2F2ECpypciJeo9O9/SxSJxnL/PmazhV6lo98DjmYLCfH6mMPVGI4ud8Jaruq
	2R0QUNp0WlZUiBqJG2FL+K8LD9oVGIFpKWydJSevetfvxSw7Y5yN3jy4/RffmK/H
	CrTpk12mMMbLbo2idoInnRFFnqKJuPJrl+pSpWBKXWSj/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrs13r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:56:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso33091391cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160581; x=1785765381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=;
        b=bpni96Rhp5SoFG1NsmO5TupE0pYaamx1WZZOwmvI30lsINRaimyOmOgCr2tJE/ziNZ
         C0L+044tHGUxK4BNC+Ntaj0+F6QOzPFm5l77fVUQaThB85k3HKoR7JQ71Mqf2B0xsXhp
         LN6Be/2lpkwI3OfPNkXE1N0+Qg2tIEAT6q7TwjQMtzKIrLPaHN7B4s4PyfGIfi+skhIL
         eEDB2W/5BvUXco10O0zVBOiwlVT042FG9l4mmPJSPAvk8vyxLTrZhYawjU88cPlyTz8z
         y5sBjh5m2sjU7kfuFmZ6PWIbT4y9KdtdKNLhmqGopKjRQly3TtkJQGGiTde9iUwe6uOx
         HaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160581; x=1785765381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=;
        b=TMpED4jjsjzffcsjAl7zFOjD7IScBewGiVNz3RvPLX82TkVXTF1l1PSnfUW2uPgNPc
         ATDOEmVzVblid+wc0TJgSPF0UChWxS6GL3LZYLJm6BI5a/stuy5+LEkwX0fC9TYUClmo
         QSE3GwPT6TjNaLjMNx/l94LwPvlO3/Xs5aZ/1WaHvcZamg49U/VEwLzV01qVoagNAuX4
         iyTNyWFaAIGOhWkFGrSM5sXFVevYjZwavFNTn1ucRoB9vZ56jkcSUXAMG5977u7AB7wt
         utnS06HumV0Q3BknIkk0mUZ+YvBGtoQm/VQmvwHb3cR7EzO+NtlzzZcgxAjBStc5FXBf
         mvNw==
X-Forwarded-Encrypted: i=1; AHgh+RqALXaQy8v1sSnW7gju/QtSznfl5GC0zzWy0SMN7NFfxu7yVPoe0wfvYSEHHIB+WBm1wjvGnqZREAQ2baOr@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQ7ozSwgwt9foEcYlREzPBs6DhZ+pP6YXsJVebH6CzgGJuy9Q
	1vSVMlMMB8Ig9Rvy7XWWCuH74JiTt3I6RZC0e3S4k01nHmiZJlFBGmUlpI5kV16PBTVJt4MMPiv
	FG39TT4aU8L0HiMxAtLklqla4iKDgFoGj2oOwzRdYNMh8fSUHd+r3CG1zt9PB+7gppUlu
X-Gm-Gg: AR+sD11t6xrTckzCNzkFRVQYlf9l2nJukec4n5h0cgJJwORWZ+d+vc8fgfmkT+clnAH
	YKAmcd5/YBdPQrxf6HQYm+JvHNkL0gBTgrzCScaS4NTHwd7zS6UNE+OJ0IhP/dHBZdcLVMaW7G+
	vRpzAs6iOosarPA/Hzi1vEkHMpiaCY9kSSPHJAFxDmVc9Ulmyua3RoDYxBGtZ/sJov95xORpTX0
	DlU/cD9B3SWm2yI2HzEnnDJ+PJpemxCKmSbj6TMOTU4IFL3XZ/0N6HZ/GG71F2ojMt32KixsjWu
	QogKuAhKScclVXBXNH3GD8wFWwzpzOQs5nE9FjwAzdnsXIAraGgE7WKzZEuqpPbjhIOkN3XCXrm
	ZggCU8BvWlLUdL0s=
X-Received: by 2002:ac8:7fc1:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-529cd094f4emr9239481cf.80.1785160580684;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-529cd094f4emr9239081cf.80.1785160580162;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6ef25sm45010704f8f.36.2026.07.27.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:19 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:56:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <rv5s3s24nyzg2ue7ywspu32l23dqhwi2rupcrdzx7dcdgtbyap@pmftq6x63mpw>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-7-5cca1bef2e48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-7-5cca1bef2e48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX3N16AvjCmSbi
 QEv2xK/AP45PasQBYKnBJmPGi30waN9NhSXYa0LaB3wExCVVP19ocztJKHxvBTi5rD9xOyMak6g
 G+2N+bs54eK3Nvy7LFBKF5mjVs2PZPk=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a676385 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bKzAGFGzYs0hQffJQ75uVa6UCnVk9GrK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfXxr73fQZCnCbX
 12CxcFmQlYoI2ssLqo2uT1VPON4i7i7uhABwO54ujt7uxbfwHB5xCLjcLUIv1vzCMQecHCZZ1qU
 bXWBQREPl0OJCUIuphsxS0l+/YP2BwZ4Pih3MoL/0o4Vd8U50UxyQV9b3t62XBjDNlzYqk5dhh/
 +2N73OKBNBwrJwCi89nIQLP8ZkL7yiG4shPTLQBhpY1Uz59Nqm9oTfFxKB8tmHijAWHpB4JsVDL
 Bi2EBuXraGkMu24eNaXfsMluvfHDLkwJvK6kFUtHyyFUMAAa6ZOCBmBEBEGf/f8F6hG1wg75EWJ
 zr8tmQnCJ7kDzBvO7PSK4t0aNws50R8+ibkfqXojM1Rib0jhjhGCB/JCsOg2/caZcsM5qmRAIl8
 TYkgbqZCDtJvdzxHUxgWbg2b5zyw0bM6dHNH89sysTO1ohPhDxEqWXpZGDKBFmjCm1P03i0fOgQ
 LqCL3r9bBFIbztz+i4Q==
X-Proofpoint-ORIG-GUID: bKzAGFGzYs0hQffJQ75uVa6UCnVk9GrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270131

On 26-07-17 13:01:51, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
