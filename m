Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610778;
	b=oM6P/wU9nqjE0NsNt0N/G0cW2k/nBUxqz/F8JCrUdth8DhFHz/kXWbOsaZ4Vh3CJEmgD
	 gtzCG3CW0bI5HtDSGjPmwbEPATh7nn8kDpIcdzCkcaWUqEhfcszV4pEdJClDAgCTsvQJt
	 bcnTMjeAuzGBHn6IUnZg6DgTHqUQUdvUBppOO8S9UDPMi13NdcMWiU5p24nzG3u2WTiVU
	 vIL1vLoMmzRazeMrIjD6FqE5igFxE0zbzeIL166wcXSmkvbAhMqixSfay2lDhZMzIVHfG
	 wGESm1zutVszoC3k6ASVs6+t3pIrdW8SgmsSz+fgnvi3oOKouuCyreunQpiTispRqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
	b=nF/sc6M4fTEB8OfVAu7r5GJCC1kXzBB2HPPQhCd2o4r9ENL1tsOcnzCnwraie+INdBLh
	 wR/nMcxp+wUyNbhy2G4ncwV0BzreqkrkwZdfJr5L6jPp0MV31/1OMTXIN0GKsiUiiIuvC
	 ABEGTRz1ytOrP2eALCBqD2HPK7Wh0To+hscx/GF/I1RF29pDS1A+5sX0cE2O9dK9kwk9V
	 lx1NAPiPSTrvcmJ5vAHeZUZxHzFIzw2fOBfMieAXebzXQxcWSYmwJHiCd9SmaSWRrqQkJ
	 VcCWhCmt7OyP78PRz15GD7Z9CejQZIt3fIYW3X9u0Joc2ihjD24waxtFH53SRq1NEdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cZQjO3hw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ea+RzVJm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8697606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8697606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cZQjO3hw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ea+RzVJm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOwA3086551
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=; b=cZQjO3hw3nLs9dH/
	zSZV9+cgwxZAkEUaGEvBXzh/nOZyind3r8cQZEGYw2hzPJI232zX9ODU2MGqKIlM
	ma0z0l8zvC8ICQqrEzzWnCzmeLhoR3oBwPLGRJzQF05HDuz2tdKx+QHv44SxC9MP
	3XtFf4EeySzCImYOrWpbzaxTLbn0D0pb0oXEAlaPCxxpM60HAdghgzp1A75rXsGA
	9VWbacfWzQ4UeXEDcWTByyY8sd0hDQ58vvaHcY1vdC42pUt8ncFzQkwPoplSnj1N
	GOCAwy3GL/l3vQjWaXnlT2DXX4pBay68dxy80DjxzaBPWLJiBVZFK/TRMZafaHNC
	CClp0Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka611r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:12:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8aa185840bdso1672719b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610776; x=1794215576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
        b=ea+RzVJma32TnAny7iHVVRikKChmRY1GfmKtYWbLtCh6Uu+JjIRgNCljUD4mlNmtA1
         opfNUod37jYOavbFg74FHYvc49yY7ZKUzNBLCj5MwV6jkzzlhKofcsN7c4rgdU5pU8D+
         VmlKbJuj+FGgrNpjQ6l2znNFLlPD8BypqEftvB63q3ueGryhifJRSLhSEhlPio81itha
         79pTXX9HswEVEytBneBDZ1/1Pfmi97c5ugtmfbgFlYTu/IkCAIbhrgcCtKQl2uwqxLDP
         EunkuhOnmnyuOrDFXCZgsprBb15WfcXXkcd/va/peY+V254n9FJKeczuKh2G+lq/uRXJ
         nPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610776; x=1794215576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuANGxMXB18zd3C6yO64dyenoMbuafZrLrdBNYEuS8E=;
        b=go1xnYrSY/lMcgGBX05T99BIh/nB8TFLkFte/zO4TuzGfIpxmNRc7USUqVpihEsD4Z
         gy9ZtmBwrVcgnwZTXzpZeeoBww5PxNy11FtRTxfjLMR22RU+RRX6cQRW1LK8WrEsKgEv
         2O2JdaTmxElg8hI21/E+mAP+n4PcjxuWYnzLmRpLWW8t5M/r4DAhWdNa/Wb9y5z+BX+t
         ohyQcKdqbDbWwgV3G35SOULyxjj78ojvDczzFlgtUDVARYDNJfiF/kShGHD0NtX9ftcA
         wrbI+Tip5IfgpqSCsBP0dcUkN7+2W5ce4ydbJwWFuNBK3IiU8e0Z22kdxP3nIE9mFWbj
         63zA==
X-Forwarded-Encrypted: i=1; AKwUvBz9c74ZH0FmzH8d4WRZFAEBiismsTSqPmCOZXOwpYjHcOB5pAAt/eflTDCDmX2Lcu6vLF5V+gSwuxfhX2qJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLOn7KjJj35WPp2x1VHV4xAiLiKf3BQPDo4aHrc8uXOcXHZ1f3T
	fzKJMZtQPbvq7bhwm0l2kcs85ivhDQIN35IpnhD9p9WrUdXZ/JLdVRd/EohVj+ss2ap2zHdJ/50
	6VAcL9viftw3xwjK7lfKs9Xef9cJcYuSv3S1LVgoEASTZyZXxEq7Xl263PpaLJU+VGU/r
X-Gm-Gg: AYBFou2O/nsH8yfnlWLNJwrD8xa2qqBttPQg0BiQOK4YrpiJin/sk71mYU/S/kYtCMd
	53Dq4A2a+3ytOorG5p2GwMYBYT/9y6bk4HKZuag4nWPMp2izOaK2dzsROn6C/PVM8IaLApFw73X
	Ari2j/5y4m83S349OVL0/jV7D2XEh+/rIuw1Oaq5CGh04DuhlWfotOCj6HWjCx9rREXm1FgrZv/
	CX3FfUVbR43VwmaV57oEZxSHlueBfa0JRnjOHxm88OADAOxEZk0ToL5w7TqcxJsVJGhYUTZhUYQ
	l8RTf1L0V3xm+I+OlPbu8Vc8QmqSYp5yNxMLZuNl9a3i8BepFZa2rGbjP3zEBuQ9zhwfdaRBzH+
	hXL3Npc53/VfK5ZbqHG5XQ9uWdYq2X6mTYDc34swC1mArTPhYPmwQ6ALJKF/xG4UijQis9+Qnbi
	G+Ddwu1UoYbwKuaJS41XxCRz+5wfeO3Xau
X-Received: by 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr6749579637.60.1793610775599;
        Mon, 02 Nov 2026 01:12:55 -0800 (PST)
X-Received: by 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr6749561637.60.1793610775138;
        Mon, 02 Nov 2026 01:12:55 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096b7ba2sm2983347a12.8.2026.11.02.01.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:12:54 -0800 (PST)
Message-ID: <387c4b13-718b-45c5-905c-31c8e441f759@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:12:48 +0800
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
Subject: Re: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
 <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hg8VR72pvXnuJhyoA6YWCgZpE4-UbojB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX9pNA2WNh5f9I
 j6w4vwgsnnbRI6wEoWskshULwJ42zCJ/Pk7QdGahLfXpgK9FAtfy0Wh1NSEhTTlvBzh0SwSeKyR
 +osgfo9mAf1E/q9qH2Ze1wVTOZzgVcI=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85418 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x06h-Ri-Sg6DD3z3xmEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX5pnlgV5K16e8
 xV6h50Q5vVceFDZDpMbtX6QWfQJSqhmPtFzpFv1ByVN0+5GrDRNBvdKA0LGHiRsbmAek+KK9mJR
 gEF3YdxsSnN64GsCUSEWsnQjiBQ4H7G4d/M1xSh6B1QHdlKEeSwhdJPbYRaDqXIQ3SB/IYzXT8B
 WngD7228UMJ1p1jBpe5UEGOPTCaYOWYRIuyxuK25RPOnKA5QBIeOPqOvi84R3eMibvHhRF/cQL0
 n2z81O3D/cx6A2rcObuBGK1duEkT31Edrlp0gFQg3si8uXlcu4Kmw5Dh8Pnwq7L3/one6OOprMI
 uHsztsPMl8zECYNlv+wucQKdy5rx+yOP/Qo8hip//5rYdf2spwhJyo3uFI+gVGtl3ikKdDE3Ij2
 p5ytpqjOmiGx8thnN+1G4uLGUn+DXlhstHw1Faa66+71FhwchEK9fLEiMs/HM+UIAZQ2N8oHbeW
 pJTCKY0XfEjaXroReNA==
X-Proofpoint-GUID: hg8VR72pvXnuJhyoA6YWCgZpE4-UbojB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036

On 10/28/2026 11:26 PM, Abel Vesa wrote:
> On 26-10-28 08:20:37, Hangxiang Ma wrote:
>> Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
>> driver, including the Kaanapali common status offset and power domain.
>>
>> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 8cd331cfb4b3..658a39463104 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>>   	.genpds = x1e_genpds,
>>   	.num_genpds = ARRAY_SIZE(x1e_genpds),
>>   };
>> +
>> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
>> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>> +	.reg_info = {
>> +		.init_seq = lane_regs_x1e80100,
>> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>> +		.common_regs_offset = 0x1000,
>> +		.common_status_offset = 0x138,
>> +	},
>> +	.supply_names = (const char **)x1e_supplies,
>> +	.num_supplies = ARRAY_SIZE(x1e_supplies),
>> +	.clk_names = (const char **)x1e_clks,
>> +	.num_clk = ARRAY_SIZE(x1e_clks),
>> +	.genpds = x1e_genpds,
>> +	.num_genpds = ARRAY_SIZE(x1e_genpds),
>> +};
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index c0a4fa20eaf0..aff9e66f0352 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>   
>>   static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>>   	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
>> +	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
> 
> Nit: Shouldn't we sort by compatible here?
> 
> The rest looks good to me, so:
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

ACK. Thanks for pointing this out.

---
Best Regards,
Hangxiang
