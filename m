Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E9362133
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709677; cv=none; b=Y+2IzbPc/xrT7SkIMXAup36RHV4uiWsmqt2yaG6T0mKPYNyhlz44aHRujn7+bk6miUjXha1vrvt+hu3RXmfjb7GUJzKJnQlRwnd2mGvllngFWDnjvquHlGIEZkleBA0buKKXkATw2lt+9+FYduDt8S9slwPgHTjGZlNo1Vt8G+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709677; c=relaxed/simple;
	bh=Qq5Z9pdI3WCpDQKVL6vyoFgxWJ8z9w4v5ed7QbTfgYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSEX/cyOy+BEJuzsWteiF8vLtTsopNqzFhBz/FiaF6e053oNGZTaRiOsn7sLG6Ktl+7rIm6+lWLaZR7LJUE1rvZwH25UEK3cdfDw9nXCharZ3siN07e4+g20XFQiAMqB5VRKNff+p8Lp7dAIf4w5GdZczPEZ7z+z1KMEf9ujT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiUod8Q+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBiPUDzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RiUod8Q+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBiPUDzW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EWHlx2096337
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Sep 2026 15:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=; b=RiUod8Q+hPKtNg6q
	lOXnR+TICE5yki5olBYNDrHWNCOtU3q/IZRU3XGjns/3X9fkyzBofWf31R74XR6U
	7QMBQQwzUHhPY7MHjhAz3qaN+xo/T8A2zKHop0jI2DZNmu/shOcxnZfWWqwOUM9i
	d/kc8sJ4vnTNrnOzjAZEEY1mfgKIztlmGi5jc4jjYyLFrL0NhHbieSDUKVe7eUor
	qLjEKRl7OJ1B4+nur1BLBCarGbTTb0qKFUde1V6T6F1RDkDFQA8K3agv6v1uS4jb
	dx2DKBHCStVhzqRtK0s2Lgly1iVNlOBKRE/vbXNjL12mVJAPt2dtHxzgzocQpRWo
	BguGGw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga1s3vag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 15:47:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso4363040b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788709675; x=1789314475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=;
        b=ZBiPUDzWPvgLmOy95uMW+MXyndKbNU7sdT5xJhzMUGut4qabfOQ/1nfsez1uDVVLQm
         UzI6UyAeWl1ryLGN9uFoxItoRPLf+TbE9WfpQS8lshacUoazi9A8WDh94gjw94AYYJub
         faiPwP9IIQ+ZjM4AcuCSdpMd9wKIw1mvNflCyCA9GMHuZNG+PVRi7osGUSDB2csp3zDG
         KmUVpcj2qm42FxegZl3uhkj5lljGJH0nFDKK4ePpvTaJW4dD/vBlROCvqhDJDYmB7tHv
         NsEgGAihRZVp0+bxS0Cxfnjpp2cyhM64hkXM9nS2nBsoCsYEkqEsC9CCcf4u7JCGxAX/
         QD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709675; x=1789314475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=;
        b=S8M7RvFmjJwOF8IWzOiBv7YFpphbNdaFXmniItI3NCQ+ALJVYstgT4VK7NPSc3reMP
         Iwaw4u0yiClna90u5qxK83XipWQELt7yKsvsRNC0rvnsRj90WY0Z2Fd5UmH/b9UPg0l5
         yn/lGGjORjYna8rK1kVAUEjFG4SZ+PgrQnuPsJliOqj3wDxcUijGEEHBhaAo2jkzA4RR
         /gD78FwgvtmavTEuNr46m/dnBF7XoYGRjqkFSLCvtCqr2YqVHS8Xrx0OipqkfWpcVwRb
         CUypD8LXA8GybLvQ4ixqc6HRXFc7zrKRhd3NAn5C8VMhpGaniE5LM+BiQ5Ke/h8WYE9Y
         OsZQ==
X-Gm-Message-State: AFuF++mZogcaFDJJT2zCBn+VRUSzTGl/PTqYpri7dUjWLYrRgWh+xqmK
	+aBIwKQ/p6G9QCiYKILpzyUBM+i8hHCqoVR5gnLH6UMzLn4GjvojK/u8w4swhBQN7inq3miUjnO
	I53n6KxVCVk4GVv6qL3/CuB5lERulQ0/CMBgHGkMXCsJTQM8/YePOgHJNhJwX5ieUqeJj
X-Gm-Gg: AYBFou1TKljWw8nf93ryxMje87mzPj0wOaDtCotTSYoiqw3kFFmomRgSbXK9S+VOjYM
	+tW8I3dHCGYBkEWQMDVYyoMrd7owTQaj7wyd3gIMLXZNm1OXhdvA2KUBDKMUMBinDAtGrNJMb5B
	7gNRTRCWwK9vH+aOcCZgRFY3Tdk6YmALXisAlONmyIU2DDUKr556Wz4P1RktYv1ZJS3tf1ZMd2X
	Gsov9t/w8uUUzHrhTiRrL0RmuNvPoE1HMM6gE2OSXnb5i8h3OZUfmQRK+ms6KRjB9vapmhXGMPp
	v2t/YE3utRWyYDi2C0QBM35U4aFG1N59oICmbifr5r1KUigfWtQT12I2fbp+6M0/EpMoAJBjqrP
	vp8dTxN3hkGyOcXRCmJLx19sXFQwP
X-Received: by 2002:a05:6a21:8887:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3da21418721mr21362734637.8.1788709674498;
        Sun, 06 Sep 2026 08:47:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:8887:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3da21418721mr21362685637.8.1788709674052;
        Sun, 06 Sep 2026 08:47:54 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm20951125eec.12.2026.09.06.08.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:47:53 -0700 (PDT)
Message-ID: <b0089142-45eb-4cf7-be6f-45c9889b3756@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 21:17:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a9d8b2b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zWu_p7zOJ7ruh_JjBGAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfXy2hKLs2U5WT9
 eJqDiPkhh/L/1V74vymorr2nZ8MsPvycRc17BwUYvVl+qcJWhETK8GKm1TDnvOB5A4WWRDmL6Fd
 +npfau5QLAMJ/oW18qFaqXP/iVl2PLU=
X-Proofpoint-GUID: 64FAoaI5Yk5pxbADkNi8FWgK6FDuEYer
X-Proofpoint-ORIG-GUID: 64FAoaI5Yk5pxbADkNi8FWgK6FDuEYer
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX6MTt5StlBOTs
 9pw4PSM1SjTE3Nmh2bkK/4DA2c3MIQ73zV7W4WS00+ifD8mF/WrjFdSeWXdRJdiopa4+s8ceiSn
 GdrMHEu03+ffUrGuGDVxNY1LUVcSWxbuOZAGMPwp8fYbZancvkmtH1YyZjqy/W2R5p21yUIIfWm
 qgoc3cuV9kasJ6Xlah4438mmOn0s1VVd4O3gD6zo2i4Nt7I4XxI99qQRzv68eRMEKhlS5oeGCly
 k+YA/OvtnXrzuocfOewl+Yoq2MR10+De91BqhBwc4s4y8zphPzua5PrFjB7NFqUFlDz2sQxb1Ms
 sUUGA16W8UOsMbA9eVsLcYKJxvE2bZstQkYTvu8j5xTEzZlVZ6kTzCivtNA7Au3m5vqHWhhLyMX
 0lwWQ3CSHc1Z8wQl62eLY6DPQpX0gSJ0eMu7VvSjVkyxKJIT9QXTXxyEiAWrs90xWUCWg7jdoS1
 6IjK1E6RQO8Oit9SAvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060176



On 06-09-2026 19:47, Bryan O'Donoghue wrote:
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
> 
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere.
> The PHY side code normalises the input data to register level meanings so,
> replicate that logic on the CSID side.
> 
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
> 
> Existing bindings are not affected.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>  				     struct fwnode_handle *ep,
> -				     struct camss_async_subdev *csd)
> +				     struct camss_async_subdev *csd,
> +				     u8 lane_base)
>  {
>  	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
>  	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
>  		return -ENOMEM;
>  
>  	for (i = 0; i < lncfg->num_data; i++) {
> -		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
> +		u8 lane = mipi_csi2->data_lanes[i];
> +
> +		if (lane < lane_base || lane - lane_base >= lncfg->num_data) {
> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
> +		}
> +
> +		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
>  		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
>  	}
>  
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>  	struct device *dev = camss->dev;
>  	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	u8 lane_base = camss->legacy_phy ? 0 : 1;
>  	int ret;
>  
>  	fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>  			goto err_cleanup;
>  		}
>  
> -		ret = camss_parse_endpoint_node(dev, ep, csd);
> +		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
>  		if (ret < 0)
>  			goto err_cleanup;
>  	}
> 
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

---
Regards,
Nihal Kumar Gupta
