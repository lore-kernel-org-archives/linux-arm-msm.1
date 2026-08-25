Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A913D3321
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643141; cv=none; b=M13LJyE5JZ/LZOniV0JrsMu2mQV63QoYhEoS3ezHIRsJRosg49fwzViBBkOvpj9DsXN9Bis/M9ty2MhKJAw80L4zte48fQBTp3EGiCrPcaa5An1Lqjg4jS9YGIRyrCQiJJ4+s+QDnEdBwJFEkdsiHt+GG1DFCs56r63lLfhymMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643141; c=relaxed/simple;
	bh=dTwNpKk8N8kgncWrTTO7zvLEhq7TT8nqNK5NZ5b0yMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwHUPexGQAurbmcD8WRNxH1j70nYQV+Yx4bwlND4EbGGw1HApAsdmm3W308RYsd38Gahujxy1p/SOaqBnqQbIE3pPGN/i7PZHZjzpD83yV9Ga9zZaH61uZoQwSBjpvjFW5NEeeKG+z3m+C6jVckkLp2DNL1TqIbSxe2SACB3BD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbUnAOpu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGfVn0sC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbUnAOpu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGfVn0sC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RbLA500472
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NT2lFhbfPlZQGuRI26S9oAnW
	5Z61qlnQA6zo7TnKr/w=; b=CbUnAOpuGMRJ/gTRD2MY/Ft7/OQnaVze2Xki35eP
	jt4k0N5gxY/syFPkSjQGk/A3I3cCHGDjbvcGwn0V3SY4Vg3Q13riW1UPbE725WRf
	BospkoMboko6lK2u89QP1utZg4W1+ZvTjg2PlVCezxuym0D7ydEr7PpT0eRatXCo
	a62vqcid/BDabCQADEBTCS4Oh4kazAVerO9AAxhzSfph8r85Y3tzKQ7RQHASe8Av
	xH1SnzZPSm7uK5HMkIcQ2kHNCTm0Sd7ekSA3s6OEw8Rwn3j6bZL7qOhgSr6gMBDD
	UqzloKxBlvgKuLXwQFG64/niDgMdKiW/33uabRLcyNG0qw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s2ntp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:32:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso91011741cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 00:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787643137; x=1788247937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NT2lFhbfPlZQGuRI26S9oAnW5Z61qlnQA6zo7TnKr/w=;
        b=KGfVn0sCBwU8w0xwIFP0GtayGusoO49N7Eu0pEHWaOAuZesQRoWD8QokQL92fHbl1t
         enhQNUEpOqYGTqeNaWG38zCzjCXiEhA5ysKh5Pz42ZJh4mr8fRYyWC82hbUpa/S8A5ER
         HxN0RBeDcbQ0jBEqZb3v+MT7QRoTllE1aWH0q3OybUTx4dhkpc/L3GhzcxdAaPrI1BSf
         Yr081m7R7Otd8ln2m7EKvAQ7sTbV58H+OrftaFw0J+/zp3aHG1ZRw496iAHocSHWvm+/
         LYHs/ey6fy9aJJ4miVDL/QV07vLzdn6GKO0T/PiGUQtRAWt5qQDOcDo0BBb+nldvjJt9
         gE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643137; x=1788247937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NT2lFhbfPlZQGuRI26S9oAnW5Z61qlnQA6zo7TnKr/w=;
        b=PBDWIEC7MskQk1ck4SKWkQR8N/VGPKbn63gN/SkRCeO7riHaN/2bXpl9upWnsGIvLv
         Wo16RCNdCwCrm7WGZzayuT3yGtcPz/5DHc7a2W7byGuubClq/730TNuh7Jv0V1ROk+Dt
         eLTwxF1lhWt7n5hdDZPPoTZYoZFX+6te+bfWKSDrxsfU3GimuSWkYfHOwuPJsLS2zqh0
         yEZIecF6WHgj35gQP3ATyzAnLIAIu53NXBLGpoR6gNPD4NTo1a7OJLQNSpHP5zfjWeNR
         rqB4FNIV3pg+H/TkrXq/sJUHVRSA46t77bBCdB3lEknk0WJep2+k93ko0UictcA7mVoe
         NLhA==
X-Forwarded-Encrypted: i=1; AHgh+Rpi+Oi4r6VMA/+yAchEUPcDCserJZPPxBRAnGZti/xaLNeyymMVzRZBxkvarN3oi0zHXbAZC0RlcNrudO4p@vger.kernel.org
X-Gm-Message-State: AFuF++kAEklLn739GkQ32Fy+aj3r+xL1tozGkoBa7XRoKXEIvhUwPJMQ
	RbqBP4h3AaqC+vVjCV9oQH465+noT0Kg/PDiAiABMpsrv1VLvIcWfnTMCR4dtF4eQqYm8FpoA/h
	Lzv+TZi+rgxw9xuCagjocqDCV35kGJ8VbS0md+loqoT1F+leEW+hsSQyJKDpXhgm1UmbD
X-Gm-Gg: AR+sD11pyDdMP58WF3+FzpiB+ILrEq59sd7eKLiTbzTbf35kH4QEgGZ2yVDtSxQSGhM
	iwr7CB/14HYFv34CjJsUYyhqnA6V09fX4yxbMjWzAc97woVzhvUnciEkt4WnImlAmGD5iSyuuOY
	IXTwBgzB82h65teXPNhZXfI2mFjiQbohTE8WO3AuugMDkUf1438C5ZLsMaDzkEuuZeN6K66Zo/v
	yLTpXK6rCPHyqIUtQ7J1BD7ylsBIm9XhqvuksqA90Uc3dpXHgYLf8lUVFcoQAC7Ix5ChWMAnQVH
	hPv0NCyThoZ2FY7U8qeS8L4yXWYZkbW5+szQYBTh0pVDQjtWJMKD83WV331sV4cQrIo3cWPYcNx
	S0nlIg89c53/VEA==
X-Received: by 2002:a05:622a:1492:b0:52e:8ef:5960 with SMTP id d75a77b69052e-52e09cd9537mr233725501cf.33.1787643137294;
        Tue, 25 Aug 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1492:b0:52e:8ef:5960 with SMTP id d75a77b69052e-52e09cd9537mr233725191cf.33.1787643136883;
        Tue, 25 Aug 2026 00:32:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296a46sm1771952566b.21.2026.08.25.00.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:32:15 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:32:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 00/47] clk: qcom: Tie CX power domains to GCCs
Message-ID: <mpydtxq5qvohmwsujzll7ilxi64vareizsvb7x5suydycwobhb@cjyu5uavd6ch>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <aoxxR2j6s3r22q7K@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoxxR2j6s3r22q7K@vaman>
X-Proofpoint-GUID: NtMlLQyvq4qEI77wGmLsyzOIUwZsUYJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2MyBTYWx0ZWRfX46ThEN22Qjon
 8mv4eqwgF2xnVwLjv67GXSM65xGwjSSFx8jXByX92tG0SXY11iXEl3m7YtUbK2THmPbrIt6qGpy
 zt8QZZ1xE0ZPvB4eV23VpfPEMMvJ79VF4GU8MAQNpH6mI2ADfXw1/CUwuGfInDyN87Mr9Pz7JC7
 X2PFhXt9qbB5dMohGtjD21t+AN2Ov2v4kIQ/vzx7dNKXO9ouOnEFGDiPABrptLH4KZSZSVIq7bZ
 DxzbUFM/6eqDkzz23gwfuebcUIF4WcM4878gWPMgor+Kx3ouae34CpBVARnCYqDbHRzAMPGzG03
 BJ/w4qNmB7Ph04G1wRQFz81/ThJmdw2vnVI/3hha/aJ+5e0lN5BHxe59LA/Ce+cljEu+lGcD1Kk
 iYwjHZoEX3DtqpYh7NMFdnBjNFUp9ihfR/OLFC+yxSSr4VH5x6h7B4VI4fKssfIM8gSmmumoUS9
 sp75Shrr7rIR9bSUANg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2MyBTYWx0ZWRfX7rcOOHrdCCpD
 c67Smrqg17qi2tz1b4nQK6aNXgPDKMzt6ohF/0U5LI9TcYCDcXWSXUkfhKDLy8zA52phnSpEAea
 u+0/kEpcM2rIBs39P0mWCitPBSUGXGQ=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d4502 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=fUZsHnY_xkB4NMSKZDEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NtMlLQyvq4qEI77wGmLsyzOIUwZsUYJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250063

On 26-08-24 21:58:55, Vinod Koul wrote:
> On 24-08-26, 14:53, Abel Vesa wrote:
> > Tie the CX power domain to GCC clock controllers for SDM670, SDM845,
> > SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, SM6350,
> > SM4450, QDU1000, QCS8300, SDX75, SAR2130P, SC7180, SC7280, SA8775P,
> > X1E80100, Eliza, Kaanapali, and QCS615.
> 
> > 
> > ---
> > Abel Vesa (47):
> >       dt-bindings: clock: qcom: gcc-sdm845: Add CX power domain
> ...
> >       arm64: dts: qcom: kaanapali: Add GCC CX power domain
> >       arm64: dts: qcom: monaco: Add GCC CX power domain
> >       arm64: dts: qcom: qdu1000: Add GCC CX power domain
> >       arm64: dts: qcom: sar2130p: Add GCC CX power domain
> >       arm64: dts: qcom: sdm670: Add GCC CX power domain
> >       arm64: dts: qcom: sdx75: Add GCC CX power domain
> >       arm64: dts: qcom: sm4450: Add GCC CX power domain
> >       arm64: dts: qcom: sm6350: Add GCC CX power domain
> >       arm64: dts: qcom: sm8150: Add GCC CX power domain
> >       arm64: dts: qcom: sm8250: Add GCC CX power domain
> >       arm64: dts: qcom: sm8350: Add GCC CX power domain
> >       arm64: dts: qcom: sm8450: Add GCC CX power domain
> >       arm64: dts: qcom: sm8550: Add GCC CX power domain
> >       arm64: dts: qcom: sm8650: Add GCC CX power domain
> >       arm64: dts: qcom: sm8750: Add GCC CX power domain
> >       arm64: dts: qcom: talos: Add GCC CX power domain
> 
> Don't see 845 dts updated?

The sdm845 already has the CX attached to GCC, it's just the driver
that needs to change, to enable the runtime PM.

I'll fix the cover letter as well to be consistent.

Thanks for reviewing.

Abel
