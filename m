Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1671470869
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421460; cv=none; b=et8mRgY493y93RlGAyK+Qd+LwBiVCN++xxd0U+KTsfmoQeoOThhX3mN97T2Jc1h2tWPxEmz7BxuBelaRJw/wvpcvX0FPMEYfejoQOLEBR1Dd8FM7OVJQM1PcHVJR9cIvw70rIEI2rDKSgDbjacRnF1DR51AOjxq0SW1jvMjMzHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421460; c=relaxed/simple;
	bh=b1+JvOKFur6JYDex/9XHOzlFZjLyOieoNE0wIik5Vag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvtGoGEWz16mwRcp60COnm9n/Iugr/jylBdMmybUEkXfdPRMl7EL/ZmQPb4PNDarjeNhsmyIdw8KnH5iVfLyLd3WgKiPKeasnswAY0YFTlNfm+d7mzWu4spTQRK9ccZTpJDkWt6/1s1+yXezKiWfRgDD9dcfpdaEOGDuQFiBRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHPR9BiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDl+2orT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHPR9BiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDl+2orT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JDxvW92625959
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXN0spHEq1C0VgRVmQrse2LW
	1BQTtrwLR6Yclzmletg=; b=RHPR9BiV+Pp46tCGRgWnCm6kVOm7I/lyfYhFO8HP
	1PQjpgQwl4BH0mRWqlrqXh9L7o4SpPrBpsvGK4Ebhm9It1tdihoVzl9LigmzXNT0
	Q0jMYOLXCnMcK2397V19FF532TP+pZk8FXPRp+GSkHDo6jFsM8b/wTSBqIpBJnsv
	8fdDfS/EsC7SHqnIZ5t2hR42GMlOO9mBZu+XCBHZ7ySVwmXgqY3FuIc5cevHYlg0
	2svh8F2wZFAMcwIcRsOCDl/UsQ3XzuCSjonJABKlBOLOpU08IEw7fK7MyO7OHOeE
	Y6b5CaZOeux7LlW5/XanjzUrrcX6+FbIecl85RCOE9VWJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfgj5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:50:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so483468185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421457; x=1793026257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXN0spHEq1C0VgRVmQrse2LW1BQTtrwLR6Yclzmletg=;
        b=LDl+2orTrwB2oHE3cOUURKPzVMW1ry6iRZf6URlLwCB5fsJhiPSBYtB31JxQ5WQ8Ca
         z4000GpZJHGAtrpIjDFUqtHDLkesrhAcZ4vR6s42mua9YCUsCZqpt8xr+TJdhgGgSEAo
         MRJPYq6b4B45MZAREXD4Kdsp9edTkbiDdKQzO2NTvrPXtdrzpFpcnfRFeq0kfaQTFD6k
         LD34a44pGeWLm3hCSfUyomFcAw7sYrnQySZGerwMMsk8XgKnHdNP5RqgwCUWrf4B7qLW
         1qzHpCmehvvoo0PKFONnXsdJEMiWcxcw1QuY4/R78ZraIxY+QQrdeAGxaH6I4m2kvrvb
         Nygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421457; x=1793026257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXN0spHEq1C0VgRVmQrse2LW1BQTtrwLR6Yclzmletg=;
        b=dG5deF0UvWGfBSB7tdtpk5n+B6oxcNB4+gv19mjhFAqqmF6bhKVlzPXezFevOaNAXr
         I/rcpFyHlx5X+BDK0fQBr+NQk7YNdkwxvBPR/6+02cppJ3uMNO6kPhISb045bpFvoafr
         pqTuPIdKJYUGq/XEcavqrB8hn1nU58Xswib0T+ijsCEDQwLRLZAtKqAmV1+ZLjrfdiXl
         ScoraLHDO1EzODZzle+noDEn4xUO0Va8tRAZI3Dl3faAuT2kvqn366fvpnLZ3mENRxj4
         4bjO0sBdjPNtqXdBFTPtwNUzR35T/idB3H6enCw3jNeralrHkP6wQmuAZAS4D/ihwB+q
         CPoA==
X-Forwarded-Encrypted: i=1; AKwUvBxTGcHfElenhlQKTHjcz31JcwTBMe1ZQPb8ZceUlotvOH6kyVfFtcRm0fCyjsLWA+yBr8D+7tcEw3yvmf51@vger.kernel.org
X-Gm-Message-State: AFq9FYLJi3tNUs3yV0h+JWaa0yQ40sVSRGrDjiDgYRYOOXdaYy4UFWUK
	EiW/zsK6y/VlaQT8/j9QpJVID3rwkol9A5l17qgKXZIoGhNWQVRZ8bxUKv6bgfOMpUhC6trr3JW
	k9VboQdYQub/RkBvc4vpa4rMvoYYJYMn1Q7Yv92NSlQX2qEq4L0ebNUw8wjtA2OsjeZzD
X-Gm-Gg: AYBFou3bZPFHMSVroZoRfGiARz6lGhD1HFqSF7M5dR0vKFBz31MetDsmRlQTmzrYdHk
	lPri9QOJMi8rDIAd/24LCWthhdMo3jRTRvHaGKYPq4q+irihQGcgSU6sFXQ8tXkVbLfP1K6LP9R
	ybszhVCvd0AsBdJCbrVm+raFChuawx6NqtR6b+aS3pQtndtwgsmf51tAWR+5hSSMAqkw5ENrINR
	hfSsC8AcnT6a5fpxA+0OJedea4nNaX587xe6oyDpTWV0l6m556ZKk6L6/Qv7/Ufdzxqd8In8eg1
	jhxopbv18t1XbZEFtB7BJ0gfxuVeULsCIRJMHHCcy72uHGhdj+nM6cgO6E6+50gyikt5HVYT9W6
	TjJOmdYmL3LYzmn+E+JNo/TpTxPLcSayP4T1cdgXZ+PmlPaMuRHBw5lmFSkjCDFgxFHyKzngvlv
	eDv7cB9LXTzlD+
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1290428985a.83.1792421456879;
        Mon, 19 Oct 2026 07:50:56 -0700 (PDT)
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1290423885a.83.1792421456391;
        Mon, 19 Oct 2026 07:50:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434ea1sm2164210e87.41.2026.10.19.07.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:50:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:50:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect
 cells
Message-ID: <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: fIy74jRsOdRr6a7x5d9exphXRA5DMEvs
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad62e51 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=k6MwsNlTf8-CDefABFAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX7zrg2NOs0HTs
 zw/YSkfIAJTobhsU0PmTCPafKTd7S5vNr3UpTGGZBb88/hpdJwHZsMojTqkO91NswnIm6WkB+6Y
 TFR2xIrfujthlhLF15qa4xmWU17kR4Jze+i01vwEJc2aXRZVH8baeCUWe5xzw6eyeEivD3z22FY
 BjL7L03PzledPu+R0xkCkiDOyN4xsvHL/qxDEh0wDe7/hDEoEvP4koIz7U+/w+dIFhTd/4LT2E2
 kq7AFJ/7iRR4LYPQF+xBhp5twy9+m1Wai/MPOgSti90HtQnzXdncavcBEpoFg2rPYfGUrDln847
 pHogXdaiEflsFUirp7b+FOzfDV8JqVOopqWMX2qHqVt1cZEPaH3vZfadxyxRbWrop0lLDGQn8Z4
 Ifkt2l5OId3LnCQdsm1twJXAWXrM/LIDFPbny3nVjUHodpKdOLnYFLHGBjvKJ7Ns82/McLce9C0
 KhutGBGB27zTBIliPaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX7Ie57DWOzneZ
 d+HlPN0Ts1cMuXJ7fDsJm/Gy5xA3xr4Fn27sn+W/4DK6vMOVcZ6GQK1dNafW+KRP+UsbQIHxLX0
 1xL+3zrVuBvhI/J/cZYGRr7Qc+WJefU=
X-Proofpoint-ORIG-GUID: fIy74jRsOdRr6a7x5d9exphXRA5DMEvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On Fri, Oct 16, 2026 at 08:07:01PM +0300, Atanas Filipov wrote:
> Add #interconnect-cells to the camera clock controller so camera
> consumers can request camera NoC AXI bandwidth through the
> interconnect framework.

I guess currently we have only one consumer, camss. Could you please
include patches converting it to the bus voting? Be sure to retain
compatibility with older DTs, which don't have ICC provided by the camcc
node.

> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f975c2183269a..e923c74dc1435 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4675,6 +4675,7 @@ camcc: clock-controller@ad00000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> +			#interconnect-cells = <1>;
>  		};
>  
>  		mdss: display-subsystem@ae00000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
