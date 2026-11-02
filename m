Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634860;
	b=ETaO2lv1QhsfYZKTmZtcMz7sbPGtRK2Fa0KoAcFMFYfopMHYCp4yOE2fI24ti+3Tl3CS
	 z7X8EEaUCi7c+sA1iYGLO7gZ0j0JVu89uy43TGwhFiuRMLput9SwCqZx23vsieDyIQSxR
	 dtciKBHMaXLxSsK+jKV/nYq9HEmdTDl1B3lnPAmZqZD0Hgfqx23vjcperkRe44DeFIRo2
	 yJnCNnb5FzfdAPMUYPqy5JE1rUcOZnp4jXEBo2jK126K1YYMXf9i+qUyRcXnV7UcXyYvP
	 IiOGQu6ug/vZnH8uiq5jNndKvODj43a8Xx50yrBDLwL4BzzWHkiPGivgwN20W2xP0Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1LE/KEw9I1BDmogKb7eT/az3rbDg025MtnoB+zoMeP4=;
	b=BxvsPaBGLyxbG/YbZckvxp1nJSYs5yMovpJXJgs07sIS7uhnNpSQ3d4sKmtmE+fQYR6C
	 OraVk+bmXk2rT9su5CcWb0Hn224JFr1p9CQhGLQp9YiF1mw2jn6velaoFKsfzdlfrsb46
	 B6FM9wMriHrjbfn+ufyddWne/Rc+4QWRF6i+R9eYVnmFT6Vje0KVFN+gOZoFItwCMnQ41
	 9i331LEWBD4h52GeNkda4iO2SURfW2Ln5TTYxAkZuFxn0kW9yH77wmpTnKCS9oq49L1QI
	 NXGPZhFP2M7XmdNbcg/1O5RZCOhJ/O/y9IM0S3HnkmG+mwsQZjaxYmKVm7N/ZYrxpQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bj00Z0tQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDZDcA0f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09DE606A580
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A09DE606A580
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bj00Z0tQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDZDcA0f
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpSMP846155
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1LE/KEw9I1BDmogKb7eT/az3
	rbDg025MtnoB+zoMeP4=; b=Bj00Z0tQaL+NK0Hf9+NmhfjhpVFgfhvRmAeWxiMU
	LraM7SvRkhm/v0A7t0OZYAEikg7tytCRLBi9qfcl2Y6aQK7DieMLqO7wDAjAEj/t
	QN8Tqb5k1cpsq6kxUmkrOcumW52s0BTUE1HPGjKvCk9RzBPPlpwQZpEhRGp51DWU
	EKIXRIr0cJt+GykENZS/twIEXK6O2z0+/jFNKDIsE3JvOC9r4kMqnTk7DRAWbtZf
	YGuaKBU4LjIkbvasQtfleRzBWuIPQOB2clx2AaGcwYJz19u8NqqTWB+X0xWYUFXg
	Q3TNAn228TqkFxQsfbKoc0p1eJEqWTQxkbNOg/eTh3IS/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tgb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:54:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so608430385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634858; x=1794239658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LE/KEw9I1BDmogKb7eT/az3rbDg025MtnoB+zoMeP4=;
        b=UDZDcA0fC4h0JVD4gIXc3kYgD9PN5uvI2lJkTt4N+8iZMw/xvSZ/xLdzImAg9WiG7l
         SMDIvaqSU/fj73GPj/EQajt8cLCf+3YDIRxF/DM+d1ls9a11JUVxbg2HcC+LBr6z59V/
         79Lm1Znon/dGN10NZUrc06xHlpo3Ezk0BTxum3ren/RKWVzQxnbIDlXEllEJJZJdidz0
         exQ8QHoH3bULzYl9wxVTz4GLmiwTeTf/tE8d/qHUUl1uqNsnfloRoKxxzcc9iKpkfzBf
         AB/1S0W/GFYbYPTHPz0XA6C5FBYUH3eDxdiRzrf5HcrUaMDazzyTU2xWuludlfDGI2Kv
         Wimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634858; x=1794239658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LE/KEw9I1BDmogKb7eT/az3rbDg025MtnoB+zoMeP4=;
        b=lgjWXk2FhPLYUoTbLjNV/3OazvT/gehEI8No52wWsaOOAYHBeIHFBAUQ7o8lJu4nqM
         Ib/Y/7uPLKAG1JEkPak220gIkX1DibEuPJGPIRORmZHsOB+WPcKG1+WmOxdv7a38UULq
         C8BKZoPIdUwUekmXft6+dRlzUygrUnncJVbP5LsWyCXpBq2YolmW5pNCLet+uEjrSugw
         3kV2NgcRtcx1uHYfmCYg1BuftJTfbmwkt0jFWBTOxGqCI2WU6OP5qUImS7bGMIGz111k
         uIZjj30dIoDISAvF+CO3y196NytbYv68ws8xczuzOCAVaAdqNR7Yx75d08Sq944SiwiW
         oOhw==
X-Forwarded-Encrypted: i=1; AKwUvByqp4sWzOYgRh2xp1q5i5nLQ/2Mh73KJr9+hFRCyvphc/RbKBfa4o4NExoLsAbMpRxPcJF3uSlxTGI1oJVS@vger.kernel.org
X-Gm-Message-State: AFq9FYLBJN4LmY9zpXNjcT64oe1maLRxIaszy9QGsmSNEfR1Hpu9fwsm
	sjDJGLSJ9PcGXVHh69y+Xlnv83B3FTS6pNVXuajAnfDc321LolD+eW+Ovxpdm2xf3VjQy1iG3ze
	lxD8yiCcSwxY5Un/kmhmbJjHhtv3rGBTH8Z1FoudG3UcfamMSAOYftmLgdk8pq9+c38nN
X-Gm-Gg: AYBFou2FKDi9HLp4GQwmAiLi+qKvpzAD3WpxG/G8CQzbZdYFSH9gpUG5nNNAeSnen0D
	4Rg0C2i9Lk5BuFpGBKUGm8XZAvNh6qmQLGn5oU5xvxsu9k6RDEWVjBNkHyoA1psIIGnhtc1SnSX
	XNCvulW/dAErjBusn30IE949upOH/PHDTYL/Od/Adm/6Q8XJaX0acf1uQNewKrHrsb9MzCJT8Dk
	KcOxRysEAOSbuMGGVxL+mD/alqKivlrdTqvqSelT5jXRfof8cX0ZKe5GfbPjs2/388q1hv6n97x
	ZkctefIkh2eZiNWVzh6Qs7kalBv54Weui5sg86DZHCTkTN1rNVT113NwPEB8NkP/RRQCFuEJbXR
	e8FrPq5rij1pRfYsxC+ICN6UIyxCBPrRquMtnrvpIllnssi7NBSYadz6nI3HLRrGLsEI6XPq+Mo
	n9crkIXm8+HTqj5Pf0S9fvmGt8ouhqEtgC/4TD6iCz6earhAcfW3qlboYrI6Yv
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr2083216785a.23.1793634857904;
        Mon, 02 Nov 2026 07:54:17 -0800 (PST)
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr2083212685a.23.1793634857433;
        Mon, 02 Nov 2026 07:54:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd5c50f25sm173191fa.38.2026.11.02.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:16 -0800 (PST)
Date: Mon, 2 Nov 2026 17:54:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
Message-ID: <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: N88qtNg1QpdyRqJ8iCprKAwHJq0GD36x
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8b22a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=wGsgk0abFfW9C8vl4LYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX15v2FEhcBt5E
 cnGeU9kseJuC7qUMUkDM07AwifWZ4sqFx3IWmumtZYRMl4dwTRHse2adjzlV9YCr2NwtWvly389
 PacRULw/cUmkFBEhAaasW7FK90+keOkTc9oSYgukUc9BRbM+2T24pMXIOvYa5YoAfhCiSXAUmDR
 ZOiauAGtzYsfViOa4fePW1ibuGLl80aWOEPF65tOHO+/I07j+BtE9rANW4wulBE2xEpmQYpWUoG
 xF2WhmJlPOO8mMAk0WVqjV8SPZBSZCUEXFNQlZ5Sd5HG/cuWFDLnkD01QKAVYDidXuZd+lBLXx4
 ADVg8J9JqgYa2PQsqQ+D2kLOjpa5YC4R38/aDxf4jSbu5xF/ek5SmTKnwAEj41pOSy1ijFbxqvf
 py0XVHpOm1ktGMaO3qKhr09FIhBS9tGXYgq+Fb1YG6OB/TpvIGVLqGNKWqe2GxhLFFCrJx+vYbX
 wVsFyJSuBgepGDKZTHw==
X-Proofpoint-GUID: N88qtNg1QpdyRqJ8iCprKAwHJq0GD36x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3VMVQqZiFOuO
 EIqvMfT57n9RKf0oNMUMKIiQUYxrXQYHnQNUd51+yLmTH9F1f8phG20h5NQNEC23qWvI+EOd1yp
 stoVEhx2fUlZ/qle2IbtjyWYX9nqFBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
> clock divider. The hardware generates a fractional output frequency
> from a fixed input clock (typically TCXO4) using the relation
> Fout = Fin * (M / N), with duty cycle controlled by a separate D
> register. The clock output is routed over a gpio controlled pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8141f392c5d70acfc42cf1ff4b1722e1eff23afa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  The Peripheral Web's PDM GP_MN clock divider receives an input clock
> +  (TCXO4) with frequency Fin and generates an output clock with
> +  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
> +  and routed over a gpio pin.
> +
> +  The divider is configured using three registers:
> +
> +  - GP_MN_CLK_MDIV: holds the M value.
> +  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
> +  - GP_MN_CLK_DUTY: holds the D value.
> +
> +  For every N input clock cycles the GP_MN produces M output clock
> +  cycles. D is the number of native clock cycles in which the GP_MN
> +  output is low, counted over 2^13 native clock cycles.
> +
> +  Hardware constraints:
> +
> +    M <= 511
> +    N <= 8191
> +    N > 2 * M
> +    M < D < (N - M)
> +    M and N must be coprime (no common divisor)
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,sc7280-gp-mnd

What was the first chip where these registers appeared? Was it present
on SDM845?

> +      - items:
> +          - enum:
> +              - qcom,sa8775p-gp-mnd
> +              - qcom,qcs8300-gp-mnd
> +              - qcom,qcs615-gp-mnd
> +          - const: qcom,sc7280-gp-mnd
> +
> +  reg:
> +    maxItems: 1
> +
> 

-- 
With best wishes
Dmitry
