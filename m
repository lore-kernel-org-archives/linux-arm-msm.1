Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463274;
	b=4YjUWp/2cNrkTT3BSSPTYeKuu/xRhSKZqZkoEZQivG94HmqPl4/W1NdC/nVmIRdoXa+Q
	 VUP3C/cf9DsW3SeOqqmdzqMtWhIQAzK8BUbpJwPskzt2gOPnSTprSqvHMj3osx8pUNqIr
	 zISbZFS46n1/6pw3cUiTgJVIlmQm9yl4wFYo/VS2RE6BlG8MiBzsXSZgZfHcx0I9bIHkR
	 KmocQ+9HltQw4K++NzJN1EZTYJShTurw+x4S9qGna3PT0aSf8y5zE8YbUQMSnCuz8pNDl
	 OT/fObnts/hYA3C0BIdQH/2tZmJl2QtPWOZB3lyck1vw0QdThKgt+6aaWOvLcb/hd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
	b=ppNkZmGS4ozxIMm+VDBF5UMBZlfy/mEG66pyqQsAStII5ls0kO1Qcw9Mz27GOL3FzSgX
	 P5WBIidwMX2JFowI4GwwYYERBcfRsDCL3l76bgpfV4RUwf4gpFA7ZgHL0owF7BE/EVEac
	 39Mm5o/zYPkDNbrOrU6N+NFJu6vPvUW/ZDCLQEyOADManIRzT512mpVVvmmgWqOEEu8CG
	 wDpl2yaC37DYyD8dRq4H15epwYSz429t5tew2cTjurAdB3xBvSOYGg8DTNBCEOfj2N56x
	 3mwkqrbRhLxzjCb7D6RaSOilltiBBFxv2GsiBEN+zCGLsY4vtnQkFPwnxpse++yuTFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U4R/z9sn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQ9qK+Wt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA3606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2EA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U4R/z9sn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQ9qK+Wt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIqs4031741
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=; b=U4R/z9snMyG7KDFa
	Tgbu0rA8z0xKAwe+TYGMQ+pBVD+Rj6C/5wO/r+c4td/5PZ9LshZyf9/Droq2h4P6
	RFRtc0U9oDt//9AGRoWdzDSqUVXKOzYAkp4gqXBJ8eTSm5bDlA+ZPaE1l32Bvja2
	UADGYRSAHPvh8cYPLKgrLv8V8tO8nPD7x1z7RztWY9XbPT0F8w47FNByhUYd75bg
	lrR7NhkF9Ein+g6mVwFa68okZDuhQt+3dQW7yKSOrzohnKYiO5g5q1DI1RELsZFB
	diRmgBEZz/rpV8xXMQ2FWSxQV9qZysUKhzkRofxHMisr/IAGOAOc/3XVNNFPtj/2
	utltqQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q8es6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:27:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so8058580eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 19:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792463271; x=1793068071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
        b=fQ9qK+WtAZtZSovun5b0bX9/uXOiwQIZk7GmytSXcrBA3zswhmiZftfBF+vBnmulHm
         ymfFH6kAhmtSI1U8hBAPvOGcWxQ8xRfkFS9ia0KBUero5M0LGsyp5Q0uAkOPTZdWg4Rw
         EwV6STC1FJm4HwpesQ57LrEdz2/6gyNQcCDeRuV1ATeW+K/yNUhlo1blP827Ec7qqina
         aFxym3Q49Ys2lZL6IJ/9tfIXsHxQK/9q2LbXgmVZ/YKg9TMSiGGq1avu3WYRgKdYABaR
         VtHqc53Mos4nf29rIH8a360rAnNOLi74X1pgYR2dX36HIeb52awf38edr761CITuuFV4
         +Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792463271; x=1793068071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBnzrOfCz65WzxMkqHIRjcjkTmpI9p24LEFMKT/y1io=;
        b=jxnNXylzh8QPGUhaW4AN+75EQycIShzzCnF7yqvedBBMgmfkQlqtdktUf0gFWKkXoq
         1CHaHYqUOK7hnnIaY1X2u1ECIjpoPwWp76cfyXp7JHBcV0Q8qvZIRHxSq/j80pfz39hK
         OohyigG7tMvsgnJagvL5hJj5wqbXp1Bu2tpa1yPy+Y7jMl2CVnFIxtKVC2ioyWNugU8B
         6DhCjycm/JTLb3pl62rDdar3d5sHP5B0QD/jvzCTq1nX7412HZW3bVEvB4KYvtgQmf4a
         D6qXQhfG/zXsSuEw3PLYTGZHu4QdhPsjXA7Gz31h+37VLsMUFYd1jU7XIf7q52gDkqPc
         ujlw==
X-Gm-Message-State: AFq9FYLZDCyYBT+8SvvP+vqCufS6Ufb7MOu2uGvKlsn8a/Ryhyqw/UgW
	tHcdOCv+HceIP0wR5tIMhDWkoNFteo6qv8j/zvou7+Z+oqdnoqX0Ca/69ZJqV9ruKWraH52qInA
	DXFzBYwBC5a7z4bR6vj97CgtMj4JrmtCQ8P+YAXdXijTqVXLIOXa1DxDFboi7J+9YyD1d
X-Gm-Gg: AYBFou1+nNoAyx6xb+PDh1iOdnLzi9A9CWqsRsUAjVS2gtxtt2bLdqMdvH8UVNy0iYD
	MUg9K7e+39n9xDKEYgt5qm/hEs1274naW2qk5Vp3YRtLzTApY1xg+jKvvXU2k6lJyId6wT1vqrI
	zmjMwkyM1rnDrYd+tM5oxH2Idoygz8RMZzPBbC6G/u1tLo4CkMDH7AflFBZ6RWPn3022/EXm8mO
	SEH/Luq8CIgACgcydu+jCzRa7Qt9J7yd1pRuhHIO4430X0G6FcICoGrkGAwWraL2PEVWd0nTXie
	kewoxI9QlGLx1WvY5c/uBamv6fdJ8zGQuY+/bg+z0eCtEI5qrc0slKM+dvCdBtydRSukm7HrZA+
	jD05SQWU9Xy6G3v+RP4aAqi7IxSKeCxzagO3p
X-Received: by 2002:a05:7022:b058:20b0:184:992:c9ef with SMTP id a92af1059eb24-18513e7b16cmr13145750c88.36.1792463270455;
        Mon, 19 Oct 2026 19:27:50 -0700 (PDT)
X-Received: by 2002:a05:7022:b058:20b0:184:992:c9ef with SMTP id a92af1059eb24-18513e7b16cmr13145710c88.36.1792463269894;
        Mon, 19 Oct 2026 19:27:49 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm37166393eec.23.2026.10.19.19.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:27:49 -0700 (PDT)
Message-ID: <ec40e4aa-fbec-4d0d-8069-f6ca80d9cfa0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:27:48 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <c3608c29-a20e-4b88-a060-165116d2b6f7@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <c3608c29-a20e-4b88-a060-165116d2b6f7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mypaGpoe01efMNV6GIduF0yTINtIQDyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfX/BOqPHlMdsVo
 XAqfiWDqFhr0OxDohqimkNJAFQBjAyjr2QmtTdn4TlBPVs6W/y2cCICRM1boTun1LgRs/Pkxfuv
 AaWWObMTgf1Lw3wT+Q/O1+TPylmTPWlZ51IV/n9lsa5he5iloSFc9P3y1EyQWfDipqdHayfP01d
 3f81yX3rLCXLNS2c8sYIz5k8Cp/4Z4AMwOsWv4tPY3IHer/ga78ghUG8xLfEFE1bWHoCqe+QRZI
 6d54RpAKLoJFAbaDYSYpe8r4hr06rrIYyNbFh/hXbj3uybmLaoQgAN1ikEnEXt2oRL9jorQPOVV
 VAEif4EEhdhJICbrEc3M/o7J3AC1BQ/AH5do7YDA8EVv9blf6Fd1zZMhQN6TiQfmcKZlDUdV1cg
 PJPXdQk2cDcaBrEAfs0IB05ISgl8pB8GV5rtZFIZrIHcShlF8dqT4tvrRxg5YonsswWu+MSD5a+
 /gWvzmlMUfLA/v1gdvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOSBTYWx0ZWRfX9ucqVu/8itqi
 NOge7hUFAP3ARRSZQx+nKQ+sX8sG2NeUWxCP+2/1dxMeRuq6qrlq/ckrRi6+YdfhYl3vuSe64PI
 iqyq7Hp9dqUJE7idhNchlMceKEwER6w=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad6d1a7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=DwEuDAnPNnevPiDVzDoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: mypaGpoe01efMNV6GIduF0yTINtIQDyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200009

Hi Bryan,

Thank you for the feedback!

Will rename cphy to is_cphy as suggested.

Regarding the lane positions and polarities, you are right, the PHY
driver already handles this in phy_qcom_mipi_csi2_parse_routing(),
parsing both data-lanes and lane-polarities from the firmware node at
bind time. There is no reason to pass them again through the configure
opts at stream-on. I will drop that loop from csiphy_stream_on() in the
next revision and keep the phy_configure_opts_mipi_cphy usage limited to
the dynamic per-stream timing parameters only.

Thank you,
Anusha

On 10/17/2026 6:44 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 05:05, Anusha Arun Nandi wrote:
>> +    const bool cphy = (lncfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
> 
> suggest is_cphy
> 
>>       s64 link_freq;
>> +    int i;
>>       int ret;
>>   -    dphy_cfg = &dphy_opts.mipi_dphy;
>> -
>> -    link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>> num_lanes, false);
>> +    link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp,
>> num_lanes, cphy);
>>         if (link_freq <= 0) {
>>           dev_err(dev,
>> @@ -346,23 +345,49 @@ static int csiphy_stream_on(struct csiphy_device
>> *csiphy)
>>           return -EINVAL;
>>       }
>>   -    ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>> num_lanes,
>> -                             dphy_cfg);
>> -    if (ret < 0) {
>> -        dev_err(dev, "Invalid config for link frequency %lld\n",
>> -            link_freq);
>> -        return ret;
>> -    }
>> +    if (cphy) {
>> +        struct phy_configure_opts_mipi_cphy *cphy_cfg =
>> &phy_opts.mipi_cphy;
>>   -    ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
>> -    if (ret) {
>> -        dev_err(dev, "Failed to set phy mode\n");
>> -        return ret;
>> +        ret = phy_mipi_cphy_get_default_config_for_hsclk(link_freq,
>> num_lanes,
>> +                                 cphy_cfg);
>> +        if (ret < 0) {
>> +            dev_err(dev, "Invalid config for link frequency %lld\n",
>> +                link_freq);
>> +            return ret;
>> +        }
>> +
>> +        /* Set data trio lane positions and polarities (no clock
>> lane) */
>> +        for (i = 0; i < num_lanes; i++) {
>> +            cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
>> +            cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
>> +        }
>> +
>> +        ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_CPHY);
>> +        if (ret) {
>> +            dev_err(dev, "Failed to set phy mode\n");
>> +            return ret;
> 
> We already derive the lane positions and polarities in the PHY driver.
> There's no reason for the CSID block to know or care what the polarities
> or positions are.
> 
> drivers/phy/qualcomm/phy-qcom-mipi-csi2-
> core.c::phy_qcom_mipi_csi2_parse_routing()
> 
> I guess the PHY already knows the polarities and positions - or at least
> knows them for the DPHY case.
> 
>         /* lane-polarities: optional, up to num_data_lanes + 1 entries */
>         memset(lane_polarities, 0x00, sizeof(lane_polarities));
>         num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
>         if (num_polarities > 0) {
>                 if (num_polarities != stream_cfg->num_data_lanes + 1) {
>                         ret = -EINVAL;
>                         dev_err(dev, "clock+data-lane %d/polarities %d
> mismatch\n",
>                                 stream_cfg->num_data_lanes + 1,
> num_polarities);
>                         goto out_put;
>                 }
> 
>                 ret = fwnode_property_read_u32_array(ep, "lane-
> polarities", lane_polarities,
>                                                      num_polarities);
>                 if (ret) {
>                         dev_err(dev, "Failed to read lane-polarities:
> %d\n", ret);
>                         goto out_put;
>                 }
>         }
> 
>         csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
>         csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
> 
>         for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>                 if (data_lanes[i] < 1 || data_lanes[i] >
> CSI2_MAX_DATA_LANES) {
>                         dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>                         ret = -EINVAL;
>                         goto out_put;
>                 }
> 
>                 /* Convert data-lanes = <1 2 3 4> to bit positions */
>                 csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i]
> - 1;
>                 csi2phy->stream_cfg.lane_cfg.data[i].pol =
> lane_polarities[i + 1];
>         }
> 
> ---
> bod

