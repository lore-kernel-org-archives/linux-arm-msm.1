Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22725409613
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096810; cv=none; b=UAAE9b63NhgS9J7YbAG+9sswleVceZdeRSnjQkacxvOWZSozAsuFPHWj6KQ1aAs5oyR9fZEF2R17RP9LbdaEqRmqQVzNXWsugrgdlZ1hMya5NgDNv4lHXWNM4T8lq4XRSZlw567YuH8MeTcCyd3gR4yTF3vEMM28ebyw8xZdOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096810; c=relaxed/simple;
	bh=bejA4m9X7TrPk5Ku8VNd30bLzjTI0lzjs+PV4SUKZh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EslcxJxADxG44TkUgqcmKjU3mDJSFNU/UfAL7HISwlnJK13PmFenz4hGDJ8F2Bt0LRsEWGOzukcOci0f/SNWXTHCeNNXbGfjBfLAXO46hQ4ABUzb2Cn8DiZ1QD2Fj/jEW/e7AuKmx5/znq/gMe9GlkHteeaeNYYW/7iwgLHMrgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQFvXMPC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAOrVz2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQFvXMPC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAOrVz2x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777epCr3829283
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 10:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CY89P/qUVdBMxzcfpk6p/rcw
	KcaqK7iX8KqqclJKhzE=; b=fQFvXMPCa2VcW/Pau+UobyLCSzydGy/hveM0hBpU
	ITw7J+syUPXMrLLzJWIR4SgFv5ZA6HqDHZPHf//a6lob3yatvsjR1gZnLi5MTlsw
	RzOEnxqCo96CTCY3noku9RXdtJzd8tsfkU4q60eDHvXzo1KczMw7mmWaozVXD3ig
	0Ml9CuACgYqzh8iFRLp4mi03MsqQE83pu/q6fsqj5HOz15AUmAeY7A/UCd9pINNb
	wV0CmEDNr8BqeU5/GUsG9+JBMyvXwpMocPigAIn7WmMIGoA91w18+CPHdgX9FnpF
	PzagatCss8b8D5Eima+XSTbVYEAoR6Qb3VyeWX6ADbU/wA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6guerw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 10:00:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9083b049f73so39117086d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096807; x=1786701607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CY89P/qUVdBMxzcfpk6p/rcwKcaqK7iX8KqqclJKhzE=;
        b=AAOrVz2xW+jLUmAQVQJrQszlodDnFfpbZ3/zBW1yCSs9fWWFt+32VlPJq0hd3KuNO6
         6OaVXz56QtMCJnOxeKZo4gjd8CFPpk21cwKsxmJI4hd7B1m6LiMTaBkuxvv9nAWWSjfo
         ZqPggQlBUWtxkSB9jP9o2SfImLxvSC8aLofnoRQFePLNPg1txp0C0+vQ1YKhBt9bsyYy
         2nKoBy+YjktC+9+Ze7T8ZNxP/szIf2MgSdWCbJYMimtfzEBKZejdXx9L5frSEDrYzBrv
         VZzJQ8KZgoNPCrao081pu8x5nL7X+UGw7C9v1DH6qyAfJnFgz5svAzBH3UCiNrpZTv8h
         hIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096807; x=1786701607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CY89P/qUVdBMxzcfpk6p/rcwKcaqK7iX8KqqclJKhzE=;
        b=j0cFHqJhP/JkbqDGWb31z/Xcoa040hNiUuFQsekUHFCjN9z4KaDXlI2QXkWU7FHlkT
         cKqeXeBh7aCDeZ3zkebmnrSHlRSyxeDhC2zKtmOGfE2s5Lu9C2xluY8fSny9UcuFwNik
         cENPD7oXlvG5nViUIX+omhJhLx/RTU42z2sI2Hr+2j9/1CepbsZ6alrWWSA20LT8uV7V
         BeWBtcvScYwRm8AU8HbhBJwCdr2SOOAPPyLR1gbu9YRAE23ftxEnUR5aKqM1E6hPqJtK
         +yJDMq7cfB/X78SXno7L5gmItZi6C/wUMnAY6A5IVb8FQPSEnqlouAFf0T42hEdcrgtz
         5XBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+rNWhfYwzrH+NDSzC8FGG9ywzujWvYJAQ+Suu4z7y5IKQsSooQqv7WBJ+0anMZaf4f+pRVeUtimPGiuuM@vger.kernel.org
X-Gm-Message-State: AOJu0YwSdXIwhtwJHfyGN6YfcXJ5n60IOhHBPpJJHn69lXuNKMh7C86W
	nb2aefnIxobPlu23x5TVxwPd2ifrjkKUbVa1DXhe4WB79FCGi6k/LjKiRXzs21gf11NmzJ0/JUp
	+rXFpaoUnvU+pVIm8wtBbdShiM8h3x7sYRYvqb06LcEJ8kvVy7/g6a6UZt4u50pUBr8me
X-Gm-Gg: AR+sD10lrsmDmaNGF5rUoeUvI6rLPnmCEqyLcJ7MCbQ4t5ywe8s18NcaumXtSIE/UNJ
	3LVBrQ+e71/PTMYEE8k06sLWWKXTVP/P6OwCU42KYccJSzte/RqMtkHlYbNjNNSBWA2nyNxg4Xk
	NlHbqvhgAKBPHK9RigptsvbX9CBeeiKmf5dqseK8hpUifBFo3banG0DX/GlI4Orx4FRhObFJRvv
	qBcN8L0QTcV1k0UmGa8Ijk9XobMqEjAY0PIWpbUthCOKeUKt41ZT8crNkZdp/jcrprb79goHMBh
	9SdmLDa45LwDDarORZa2+2vCY+kPnAiV4xG6WDXGQ5k5ISWaWOqRQJx/e0wk4GDSEqu1Aj0VTbk
	3DlPXQDps4kDwysWqzMKGgqBQ90Vwz6Zpuhm2Qzjbk7M9bFYuMZDMl0A7HOfLEMaixTWA4zIaZD
	S3oQ+hEUwVEWLk5Q==
X-Received: by 2002:a05:6214:1315:b0:8f0:b50f:dcf with SMTP id 6a1803df08f44-9089b521f13mr83528636d6.7.1786096806944;
        Fri, 07 Aug 2026 03:00:06 -0700 (PDT)
X-Received: by 2002:a05:6214:1315:b0:8f0:b50f:dcf with SMTP id 6a1803df08f44-9089b521f13mr83527686d6.7.1786096806507;
        Fri, 07 Aug 2026 03:00:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050cff93sm370911e87.23.2026.08.07.03.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:00:05 -0700 (PDT)
Date: Fri, 7 Aug 2026 13:00:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range
 for Iris
Message-ID: <tdgbfewnlj3xypfnyckivnd2b6667laapkcfs2vpnk74bh22aa@obasatns3jfr>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
 <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
 <27f0b033-e940-4369-aaa0-f08426aac73f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f0b033-e940-4369-aaa0-f08426aac73f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a75aca7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=F-FAosHBmvl3iYwk7X0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: Lm_wZMqvjaR9cgwZ8wFR5WS8MkFk4TBI
X-Proofpoint-ORIG-GUID: Lm_wZMqvjaR9cgwZ8wFR5WS8MkFk4TBI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NSBTYWx0ZWRfXxMWVhAplVEvv
 3b+vH8/bWf8E8pwMKSfFi/o/uCRg7uLc7FtlxTsteVFjWaD09TXcFDuSuiZ4EQcJGDP16oG8OFA
 vwM23u5WmllbkC0kKd/krXvTzswlubc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NSBTYWx0ZWRfX+ib7czAeap1u
 NoUmi3IxfMtffiN9S8QwPQPxuGwphD6zCbkJa+zLIjonWyhXHfKR4LdfaXr2GQ6isIZsk1emLyn
 SSwyNOJESV3H6XaqetQls9ZEwqwGzsnnJu2FplfUPCuLQFvSKYHsQHZKhlb+VADpNwP5cfvL5+r
 q4/I/Tqvne3xGelrreDx9spGcYLJnZzDNYwNnTjaMKdo34zNVJLXcd9gbAOywow3ufr77pzS1YH
 HTQCRLg31mnHevw0ITmOe9k90FQkalGr/6iFfgpKth+2niyNYMqg0DIwNJVDOqi+/oC0/8EU9At
 iwVBbPeZU7JmYVNZ72gbfPa/X5QpDqollKpZ8cy8+iX0TfWbqu89TzbVxjsMQvLzF7rm6H0L3Sr
 gbREzstPWoee7HtC853LZ4J/GQLEXybHNteDTPbL8Tr0B69vleEqiSKsjCaFXjPL4KTt1L2aTFD
 GDAbnuTsBeKSDbkmt7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070075

On Fri, Aug 07, 2026 at 02:56:27PM +0530, Vikash Garodia wrote:
> 
> On 8/7/2026 2:33 PM, Dmitry Baryshkov wrote:
> > On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
> > > From: Daniel J Blueman <daniel@quora.org>
> > > 
> > > On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
> > > below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
> > > into that range, from any other stream id would triggers unhandled SMMU
> > > page faults that cause spontaneous device reboots. This is readily
> > > reproduced with one or more browser tabs driving multiple concurrent
> > > video decode streams.
> > > 
> > > Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
> > > and reference it from the Iris node so the IOMMU layer keeps DMA
> > > allocations above that boundary.
> > > 
> > > Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
> > > Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Daniel J Blueman <daniel@quora.org>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
> > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
> > > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
> > >   			hwlocks = <&tcsr_mutex 3>;
> > >   			no-map;
> > >   		};
> > > +
> > > +		/*
> > > +		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
> > > +		 * primarily for non-pixel buffers using different Stream IDs.
> > > +		 * DMA into that range triggers unhandled SMMU faults and
> > > +		 * spontaneous reboots, so reserve it to keep IOMMU
> > > +		 * allocations above this boundary.
> > > +		 */
> > > +		iris_iova: iris-iova {
> > > +			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
> > > +		};
> > >   	};
> > >   	qup_opp_table_100mhz: opp-table-qup100mhz {
> > > @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >   			interconnect-names = "cpu-cfg",
> > >   					     "video-mem";
> > > -			memory-region = <&video_mem>;
> > > +			memory-region = <&video_mem>, <&iris_iova>;
> > 
> > I don't like the idea of this series, because it _again_ doesn't tell us
> > the truth about the hardware. This typicall ends up with bigger problems
> 
> honestly...thats all the info i have about the vpu hardware that it
> restricts non pixel to DMA from the 0-600MB range. The same i have been
> trying for a year now

You are not honest here. You also know that there are secure streams,
which have to use their own IOMMU SIDs. And some of them, as far as I
remember, also have memory range restrictions.

So, if we land these patches, how do extend it later to account for all
of that?

> 
> https://lore.kernel.org/all/20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com/
> 
> > later on, when it starts to affect other bits and pieces.
> > 
> > I don't want to NAK it, but I'd strongly ask to reconsider it.
> > 
> > >   			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> > >   			reset-names = "bus";
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
