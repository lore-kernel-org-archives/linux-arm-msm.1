Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E336B90F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643064; cv=none; b=H4sPY3f3zjHb61dx9IR+bx+o/2LiQ8xWTdciElnOljARR5Syr5taxU1nXWchgPQVQEOI6KhKkY27xy2AslFDiuKmN/qNaeh+S7xj3AhzzebI872bbXoifbYxiGp4XvrT6pWps6f//6E4dfMGUynziWl1meFmER6fhUoYfnZQkgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643064; c=relaxed/simple;
	bh=DKDyunZ/NHZC1XfvKcnMDrgVZDuJLgBTTWj5TI1HtZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZ//cZDc54DXtoar2ip5WCg6gAq12+/mKpcY+XHOEeQ1AHoJzdTQgx9yd5w/lodVN5CdBhZsIwvun+1r0IHLD0/2W3S5d//D0z7eB+9wMg+vXMBqV5h2Z1FhBUw4cGp8iupjcRMB+qNoh1ZTHsKRukl1PRiV2HV7NGV0r3fjuVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHx15qsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTdgqF/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHx15qsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTdgqF/X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RDNm500023
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3ZrdwNxsDTN3oeIFvijCZf6/
	bTMX0QBcaM7IHsPkBkY=; b=MHx15qsRfgO5CIhtUd43MtQE7Uokp2CNH7d6hCQB
	hzN5OqOu+LDq1NDju4m7GFVgP+PGRSqRLzJckZHU3bXvtSZi678+77Yh3aP3o1GQ
	B+rNkW7+IbVqwWl8d3UO0mT+ZnSNfk0P+vkjRKOKkC3m4nXUrYXlSccoEYcgnn04
	1SgCrA6KCBkAxfRG+VnlCq+iZwGhc615OfOcUIXDxo1B5PVbKn2EsRWoClns7Vrs
	bLtZHsVHNDqsRCmanfKpq5w9xGD5ySLwuYP6q4WM44LUDb30W30fPMSJF8GkztdZ
	qHakSmdKf0g4zLUbSpf0fGjgk9hbGAjA3qZzrd57gglIpg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s2nky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 07:31:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9083b049f73so55107046d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787643059; x=1788247859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ZrdwNxsDTN3oeIFvijCZf6/bTMX0QBcaM7IHsPkBkY=;
        b=bTdgqF/XMxoNt9JRrv686D/xF688fXJWsv4FyVfE1aMolpj332Mw5CuUUlMcBdOv5e
         kErG2924Chil+L1rCbhl+t2/uhW829bU9YfvrrcmyUxK+ydSi1GHwQ9qTrdc29EmYJaM
         qthDlwwTejWX76aY7B+KiYpnnXKZag84GEJ697a5sHN/IddsPzQ9LNgQFweUAoPLPCd8
         0kzNsCEDXXnqeMA+l7sEzZPsDdVnqdV3bjwHKl12oIE92Kh1aAtN+zsNLH+cazWwuH0w
         S5XnL2XFjRjAYL1Jeo+n57DsMuxDQAZVPXQufcwis6ithr4dIFX9NKXX1tohEuceCdTr
         QdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643059; x=1788247859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZrdwNxsDTN3oeIFvijCZf6/bTMX0QBcaM7IHsPkBkY=;
        b=U5PYiaWazCnQSRPX1uvAtYvP1gB8bVoIW6RCV+rsFMz/LG8sfcxX2BX3OgKzXncFYh
         EwzD3daWSa7/JcEMmiq/3/DKz3Y/MQkgYxEC+2lceUKdv566MHVFNsaYs/Aqjtz8Pe0/
         3sc/8C6KGPyPP2HejIcnQfl4z47u63/o9CGl8W2ltHeR2lXBTd4/CGe70c+uIWRGzjV7
         HPafo/cW2FAs1EtAy3ikgmyrjYSpqfu6+JwHG9f8VDg0SuBh7y2XOXJUBSJH0tmc5uwn
         edSkPfMYrn7k2ADRtMJBLuVuBSxoRDDrNEvGHYYGawuxXaG7LvaZOELufpyXu/IS7PsR
         TfLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5BWO9jMPJFK1LfU0uxmjd3D8Ux2DEoIkYTt3z75gxkQqKT6SmmQomxnb06uWbAtxodPVzro+qwAmfFDeV@vger.kernel.org
X-Gm-Message-State: AFuF++mjXUHeJ/2acVxmLxm/nFZexmggezdezCtgwnGoc2OYOXzFzx8z
	FCtdPupiPfI86JRmHB2CDcnhtyhpDrvuXTVdgV9DXli7tbjH0ZKYOKQO9DAd7x1UbzERe5Ehiva
	myiM1W7x8strjRfNgrsvqPXpfWe5ojmqnnxDRThfiFfA8PGa+1oBfm/AksSRvO1mxQ5ro
X-Gm-Gg: AR+sD13ZZMMvbRgZLEsi6fBzL6On/c6WslGJISD5ARdKAf/LOQjbeuJGusuSCB4A+aH
	dqKuBuU8jNZfpNHL8hxQ6VlmgDQGRNZcazCSJp/Bi/dP3UKt4r+R2EPCLoRbAS2Cgpnab9K5kx8
	SuDICD6aKzpNKwmE+LxwQKQeUwolLViYNRGNHM083tJ/yaEjJPgmXA584ZVIRUtPFRXXKg+r1w7
	CJV/sFKlgrYyWRDmnmN4an6v0xEMcMiDDsZebfBFmP6ZwnAVkx1VOBrHRoE2boi2wVir72YNLVt
	3p3nZnxw4Jk+Ac7rfGtrof62uQK+oFYBHpGvsF/RleeHo11gEamLuHk0e7DO94/m31JuCsl9BaL
	Ais8KNv38c9s7wg==
X-Received: by 2002:a05:622a:c85:b0:52e:1364:debd with SMTP id d75a77b69052e-52e2f14fbdemr53017881cf.33.1787643058720;
        Tue, 25 Aug 2026 00:30:58 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:52e:1364:debd with SMTP id d75a77b69052e-52e2f14fbdemr53017231cf.33.1787643058094;
        Tue, 25 Aug 2026 00:30:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967383e5sm1583156566b.45.2026.08.25.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:30:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:30:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/47] dt-bindings: clock: qcom: gcc-sdm845: Add CX
 power domain
Message-ID: <qcvnb5nifvwtocgrlc5nddkwgakqjdrqj7uazplj5jpy7jmasu@o555nrglms2j>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-1-f1205a92682b@oss.qualcomm.com>
 <6d8b7fc0-9bd5-4bfa-97b0-a20bf01779c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d8b7fc0-9bd5-4bfa-97b0-a20bf01779c5@kernel.org>
X-Proofpoint-GUID: P39q91z7_OAhyAJQp2i4PbiSdY2Unuox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2MiBTYWx0ZWRfXwPlo1TRo9BiM
 pfugVmEXFq6YPcFczkLkAPbXaIK2s0SXlvjfMQI6a/09EX++7oLiUHv8PJn/aX66Xc+kVDyyBIz
 jgeESnOaeUTwdIOasNClPzHRDTam+bHrdp0gICqWq6gE4gAGBSawAqc4c4jhb345c3K9T7GtAYj
 xYoxMckEmdXA5uBNQ1Qw/NYCp15MezoAdDW+KY+u0fRgi8Ido7tbgdRJUYnPdaY+tAl695cOS7K
 w2tLl6uf3NYZzPOsAxealeB9QI8jw9PiFgD9MJhGnNiOHZMYXtkLvf0qIppBoWuJCmZzNUbnoKv
 Fevj7FxnraULNSmj45pAJHaPl+rHQUigPqBo4dqiWnhc81WwW6WP/Z8S9RqBR+jAedNtgpBOilE
 MBrxI7lsFl8783jpnPxQrVzrYA3yW/Gn8IEv3EsVTEx2GdfhbknAYJkZZz7aGDF6T43m66Zy2Dz
 B3dygIsUGgWCojbjztw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2MiBTYWx0ZWRfX1YtHPbmTa3Ce
 ZC3GHhGcn+R87MdHzq6+P8wm/Ta7oMr6zIbNniqqyP84tCPU9yJtomhl6woRKn6LlPV7aEDU57X
 LXBY9nGLzI0bCJtFnZItBG9gRJY0Aqg=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d44b5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=i6VLWpIXabWwsCG0LkoA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: P39q91z7_OAhyAJQp2i4PbiSdY2Unuox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250062

On 26-08-24 22:39:28, Krzysztof Kozlowski wrote:
> On 24/08/2026 13:53, Abel Vesa wrote:
> > Describe the CX power-domain dependency for SDM845 and SDM670 GCCs, and
> > require it for both compatibles.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > index a7523a414341..980edcd244a2 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > @@ -31,6 +31,8 @@ properties:
> >      maxItems: 5
> >  
> >    power-domains:
> > +    description:
> > +      A phandle and PM domain specifier for the CX power domain.
> 
> Describe items instead:
> items:
>   - description:
> 
> Also, "A phandle and PM domain specifier for the" is redundant part of
> sentence. This cannot be anything else than phandle and PM domain, thus
> just say "CX power domain".

Will fix.

> 
> >      maxItems: 1
> >  
> >  required:
> > @@ -56,6 +58,8 @@ allOf:
> >              - const: bi_tcxo
> >              - const: bi_tcxo_ao
> >              - const: sleep_clk
> > +      required:
> > +        - power-domains
> 
> Why? Commit msg should tell me why you are changing ABI. It is actual
> ABI break without an explanation...

Actually, I should've kept the same commit message as for the other
bindings.

Thanks for reviewing.

Abel
