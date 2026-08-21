Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A16C3A7852
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308618; cv=none; b=YJHrAbwdtHSskVnWvrYsyZQ6vxyn9+pKVuMbgmmT6b/IG0jAs9FNFDAfMHsgTNtnbNSJKX/HaQoXL5VRf4rVZp6bNRIpEiNf+nCmXmdvBptIzUjk/cgM1NyT7+SXQu4+8bQIeH6ZTvLqC6H+tFUOgI/+Q3yLxupgFJzfdxcy0BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308618; c=relaxed/simple;
	bh=b8OrTdm7l/bHAh1BFCbvKBBAJlt33YXBsSrQAG+/eqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvRfSOmyd8m6t1afxMZLP2E7TZUbNzpfdRSuwSrOCegutf/p3tXRjlyI9E/HHy2vBWmvUnQqp7ves8x6zjLqpsCG/qtHjltjuKrWOKTq9bDelZh1CLCk+VnDKB6G/sB829j59fktiR9wurKWXpSQ2kxKT7/DF1C/HiSrxB2mdTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pzhr/cUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1GLX+aC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pzhr/cUG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1GLX+aC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lx7d2325048
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+/TUZQqtWMcSQBmELloooyymV8cy7fWHjTFq4Y7vHE=; b=Pzhr/cUGL+CVVoi5
	TXT7wCB/F87yxsygEFZGnZ+L8TceExE8cotOWyNTADW9Hfx2MZwqBjnu39ZpX3bt
	A0L+aBkuaxLYyBpssKHDwyG6d2I1qK4ttWGlm71bcB6vdQWBJJsAj+GNgATVsPHw
	l27BGzDJAtq+/rR/oNyO/nTvFvjjARru6PKbKZgw6WqofUKQcr2x/Ud8ZRzIaaaX
	qhHcS+UziN8jfZMncmKEViL/li2ZUvD1U/lliPEAhUoUGIAF+9r0OCY4Nub28eaG
	fqDZzekn6WLUt8amT9bMV72I/xUF4yL8v+XL7HdkHWISQuCN0sgb7Hwjn/r1rOrb
	+wmJqw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf1440-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:36:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso1471753a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308608; x=1787913408; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+/TUZQqtWMcSQBmELloooyymV8cy7fWHjTFq4Y7vHE=;
        b=d1GLX+aCfREXn8M69pjFZ8Xj3IXmWoeN+mb0Tel1n/9KKPdHvKHvOdfutmQl78ociF
         T9B470VEoJLzPrwdiIgVNf9P6JpFCXDe5qWIl2bL1LpKLufRIc0aBUbusvE6v+dFxMrO
         H5qLjlcthcGGE8nTYW1fazqgGo2bmh2lz4e2Sh1+38w6MR4xv4u/XSUoUDPzE3IWjDfv
         opPVo1b4Mxx6qApDqFFEoTPAL02cNSj2ITfoUKg0c2T2vwkhGN2NXj2jlPiROBInsv7X
         2EHAq/tuB1ZwdjgAy7Wzk4w0UR9SSJppoWLPZACs9M8ByDU6GXIpAC/W1EuWIbOKYrz1
         gnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308608; x=1787913408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x+/TUZQqtWMcSQBmELloooyymV8cy7fWHjTFq4Y7vHE=;
        b=boP8FhKr1poXJBdDKtuZvbPoNyFvl7dMk/IQdQWTRGqHYYTk+2FiqzrBY1FBoCbDzO
         YL2ky/2dMciuCqfQuc3WuFJZiNVAHT7DfJX56Hr7ZYLErIdt+npU9PUocTfpGd/vEAk8
         l2I5R8IWLKej2iZCBlSskJwK+TRhq4aVLeYCWfw3gu3+M3pUixeB+aOEwN+EgPvEb185
         TtJR78sBtkGEiiyqcCYvCiH4fGGmTVxCUv5K66DuFUhbFbaXKI+RtQPrWbUcWKSbQ4Bl
         iW7+10HgpV0Aagbm+xg5cMkYsNfDc3qRC3NL8A93YxbdNWvaD7ByjfRpLdbKUlTQJAmq
         Kpqw==
X-Forwarded-Encrypted: i=1; AHgh+RqzjWjCD5rBk5BN8EDsEGnk5qfGQ1fAELq2hDReQBWVpINkr3KhEYqoPoJ4F6I5CyNaAVFpe6GyPJUOzKeP@vger.kernel.org
X-Gm-Message-State: AFuF++kOB7Fi2bEcFXxZWG1hsJlvuJENIrBvjT3HX0gSMPMkXUQHsWgc
	M5MJeA5XLG3LPxXE7xZgGfuh+gMg+mKHOwY/2mow//pvh+vR5ko/aOUwPW/DQ3tCwAr01G3Igg5
	tbuUkYAWPZqEIKaEji8vkK77M8tET3bGSPIBGNN+y78AKdCZYiUwIqqdup50nQ51atUyi
X-Gm-Gg: AR+sD133elWQTQsHgCPCOOLVmtS5Qe2Hi3Xbd9kBtkaPYzrqlrC4S8NMuv1BXel6rh0
	7SX7BJJbIXebZoJlyzLD42y0PfmHSdPA4inrf/Z42fBO2yzEZ6thtOVZQe4OUg4UliQ5ntAObAM
	m/x8cNY9MZoJF7qaavAiAogGdkx4GdwLUoCpK1Da+PjKeQjv1lD5y0ltoi5r7xsPZ0QlQS+VOKn
	CERbgCLVNJ1AzQWNmN5Qr25l6zZY2Vuy5DSmuBg4Cl6zsyQRaNgyAv00ZnM7FxO9jRKthrzIpJD
	shUbff+WcGTTvj0p4fvczEDF/z+ZxRm8ehSXt+tZfSt/u5HfotE9j4OIocm7wCeN/hSN1vIjkYQ
	eWzh9smTPh+wlbpBrJi/DzMIp0XjiFz7tI+qyPA==
X-Received: by 2002:a17:90b:394b:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-395c384d95bmr10132150a91.14.1787308608494;
        Fri, 21 Aug 2026 03:36:48 -0700 (PDT)
X-Received: by 2002:a17:90b:394b:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-395c384d95bmr10132085a91.14.1787308608069;
        Fri, 21 Aug 2026 03:36:48 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c467d907sm2662874a91.7.2026.08.21.03.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:36:47 -0700 (PDT)
Date: Fri, 21 Aug 2026 16:06:39 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Message-ID: <aogqN5IUBvHgmpoG@hu-arakshit-hyd.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
 <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
 <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
 <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a882a41 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jk3V8XEzhubCWnqVx50A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OSBTYWx0ZWRfX2Hi/hIosJzac
 eRAJ32MM20kWBhbJS2H/ZJNRlq/ZalBuQmchJs7drOcD35jEnnreaY56ihb8dCi5UCCIi1ReXJR
 JBaA/RF9w5w9Ww+eOtQ6WaHONYT5f3xMK5fdhiRiSc1xTVqLREOgVp5+mZPiodq07/3LqwEkbIu
 R+1ywosWtGzCJxfLCIC74HXZt+ndPgoCFZOxw8/Xi9nKHbGKdsHJJshgzSOp8/LywAJlWZff926
 /zQUCdXhsRR9Z02S6YPzEXD4W+/t+4+Cwvfx6bMEtWfs2CmgmOrzBztfNS2YLBfbArgkpN2ERXG
 884Yl8qOl++kwKc28AN+eaeF2XJu1WlWk6iFPzpGX0WeuoV1Xw4DH/dFSZZBjS44uYjaDa8xF2Q
 m6C8YypThaoZ/r0qKMvFtlvhxQfLUuJkEq0lZV729dNrQ6a4SIj/HbcFqdnstnWx0NRJINLYJkl
 /FcTrK+g+OsjNuOvBJw==
X-Proofpoint-ORIG-GUID: sDdXK-HV_4iUfE1rBLqMqyBpuMdNNe8R
X-Proofpoint-GUID: sDdXK-HV_4iUfE1rBLqMqyBpuMdNNe8R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OSBTYWx0ZWRfX5Uz626chf2e+
 qO3mU+HEmgAtYa4MQN7BOouOUHIBlXmrPTLq11zHygfqs3DIdaRmRoX3nz5EUA4PfP0CqltW1iY
 IXOKAzsn/a/Wn/T/zA3TYryvc1rDsag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210079

On Fri, Jun 26, 2026 at 04:28:54PM +0200, Konrad Dybcio wrote:
> On 6/22/26 9:38 AM, Abhinaba Rakshit wrote:
> > On Thu, Jun 18, 2026 at 03:04:57PM +0200, Konrad Dybcio wrote:
> >> On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> >>> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> >>> an optional OPP-table.
> >>>
> >>> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> >>> platform.
> >>>
> >>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 37 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> >>> index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
> >>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> >>> @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
> >>>  			clock-names = "core",
> >>>  				      "iface";
> >>>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> >>> +
> >>> +			operating-points-v2 = <&ice_opp_table>;
> >>> +
> >>> +			ice_opp_table: opp-table {
> >>> +				compatible = "operating-points-v2";
> >>> +
> >>> +				opp-75000000 {
> >>> +					opp-hz = /bits/ 64 <75000000>;
> >>> +					required-opps = <&rpmhpd_opp_svs_l1>;
> >>> +				};
> >>> +
> >>> +				opp-201600000 {
> >>> +					opp-hz = /bits/ 64 <201600000>;
> >>> +					required-opps = <&rpmhpd_opp_svs_l1>;
> >>> +				};
> >>
> >> Since 75 MHz and 201.6 Mhz require the same power level, is the former
> >> OPP any useful?
> > 
> > Yes, both use the same power requirements. However recommended by the ICE team,
> > the DT should include all opp/freq supported by the hardware.
> 
> Is there any reason at all where the OS would prefer the lower OPP?
> 
> I think you at one point mentioned some dependency vs the storage
> controller's clock frequency
> 

Monaco UFS controller supports a 75 MHz clock rate at the same power level, as
specified in the hardware description.

Although both frequencies (75 and 201.6MHz) use the same power domain (OPP),
retaining the 75 MHz ICE OPP allows the ICE clock to align with the UFS
controller’s clock frequency. This synchronization is required for the
controller’s supported operating modes and can help avoid unnecessary
frequency mismatches.

Abhinaba Rakshit
