Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611096;
	b=oPyRXCfOWyNMaghBHeT06s3Y6QCbxZIhbxhSVNFS4Z0EFCH7CvQVhjBf7y1yHH2xf+3Y
	 B2b3gdkNuUN6usC/J6zVG/NXODnfWg1RxboLvf045A9MKdopOLZ7/7E+nDeE/VwNsspCF
	 hyQfUnWzPBtcjiPGTwu4R3Pn0UE9Ys/LRpJYtwkeuoIbO9SJzidJfsVU4F7acGyu2p1bm
	 t3nQNK0tF//qTx0JFsAE++g8NgMiB9nfEcw4rWrruYStkKQ2qnbJIpv2rkSY6bZ9eiiXM
	 1gGDFUYZuf4Qb0aXqjX0a/Ylp3LE2ggThK5qBTc3SeAw4dcV6N+JtA/LFbwFGfgT4YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GNaiykJMZ9ZERRTHFCTAR23L25CCvCxxrRhl73XmV5I=;
	b=pjJsYKCKPNkg74Qgynaq5YHpuvRLhb3t9Mm6pWsG75AklqqmZYgMeewNOZ8HSANr0rx8
	 5zDJx1mYtZtOO6N4rGTF1MuefL4/4pCBZAZbquGVzmFrx4w0kMaZQwBYL2hYZwpuqjqJ6
	 0KcLWEzN0m23XFPetEz2t0LmDuVI+xhATGnN5JFrDEFB0c2Fbbytyh+2xks56cl03ASsC
	 ZjGzyMt37p3Ov2cQqr2qIIGfQ3rz/i/5z8JjmVOVEXgo3E6N0fWn9Eo41Obk2o+eOY5TH
	 TfVOPbBJ1vl93q0mcvp+bteYmKA696HqeueZtSqznG8NaFoE1yZwuePvznG1EM1g1CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AovAE3VJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5oNVJE3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D17606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99D17606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AovAE3VJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U5oNVJE3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQoA2361172
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNaiykJMZ9ZERRTHFCTAR23L25CCvCxxrRhl73XmV5I=; b=AovAE3VJ0TaYsNYn
	E8ywr9B8rjHa+QUP8TmYW8aHcBvsbeuh2XY1xazLqOGY+xlaMqEUplRCreqXFK/B
	OBjhsXe2oLzzPMWky29RuuosI5rG316XsZr1a1b6CaSwRM5XF6mV7/3VPnB7zYR5
	UY+v/dIK/3ZMDBrMzEoqDjT8pVmnaoToHSniHV+yWvBTKxPPB3msreKL97Hifo0j
	89SRUrJNag8HTKqqDx0CEhSYjs3ngWM7TATCJp27neThcncbecNcr41Z7aozcnd5
	zzr2Rdup4LX5uFw+ALyU8Hmhrvz2BY1SZxm9nQMqJbtDj1WNZQQrPHbN2uQRGeRT
	sPlKrA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x44e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:18:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso2704506b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611093; x=1794215893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNaiykJMZ9ZERRTHFCTAR23L25CCvCxxrRhl73XmV5I=;
        b=U5oNVJE397uuRtqS9kXPv7f4x6sZ+tE1TkW1SyuARj4WRPuDTuvESI97Qbebz6SLBO
         O5lw52d9jtwdFTAkf9SPw+SAOD3H09bw2WrfqwtCU4Y5HCTlfMbLMuWXFnq5iXX46zdK
         EwWIz2ODJ/TJhcILpvpvUPQ41u6IBsGcBSjK3ZPj2taQ55SqaIqPmxTMhqinauFD46Xg
         pRBeXLh96iBLxiJOpjmWXEucBdRVKwYsLFGsTAi+hL5TQbecWHZPbRULoux8Snp4dBlC
         ThxdNm77CCL+g6KuLh7KaRwr0AxoKW3S7H/FtY1u0G6ta9gN3RSO/tp1GQCmL9HTk1z9
         4eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611093; x=1794215893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNaiykJMZ9ZERRTHFCTAR23L25CCvCxxrRhl73XmV5I=;
        b=yhnnWpLwzf7aVDTfiNT+wT9yhg+Qsf/uhL8QYdwfuEPjpzHiHmxKBjdoWw/zW7DOEv
         0LrS8/2ejgZtBKsMCf0G37Vd973mgOC50/2NYqdo6ISxcj5mWy9vbB3znXMpY2aNVZRX
         ZV+koGLWSXUEI06rNriTvxsje8ia7VZrQoBVmo3++zSA3SwXrT1xCS+jzXKrArTvpK0i
         bj5kAn9qEzI06Qwb/MYdqQEUPE8nSQyQm6rrzNBJq+6oQjnvAOnXL+XkGtd4eZkkfA/6
         JJOZ0qT2mQETGsxbX6e2PcGjKHDczhdJj0OFDC0XbXLt1ScszaC0llWwT2nL/sXq9GTJ
         6d9w==
X-Forwarded-Encrypted: i=1; AKwUvByXEBDB0t2S+TazBjS3C8hJmtwwwNUa0RtCLC/DH4G93i8ny6QqLlGvruFF98CLu491cNK0815IR9+t8kbW@vger.kernel.org
X-Gm-Message-State: APuU4Z+BLhi2u9fyHXgys9I2NC/1Zwmz0ha3s7ipgugygcy3H7IQ42cL
	qbi4pjnVkutc4NiJoLX4813sgopHScr5zeoEHD9zIJJq5cT/0hdz++IoycI2p3GhTfZ3sqs3cfj
	8Mf3rHSDmoA7KSCLrFZGgD4xOfKRhxupDhvKYy80yB0WwB3OgGIcJ//42AX+yuNzKMsTc
X-Gm-Gg: AYBFou1xyDlMgzSOXlqIQeD6Q0GpTsY7S5Inf9Kk5dF6krjBrzOgg9wgJHrnnwXFrnj
	TBGHfPBAYeRjX/2/cGUHhhWvIwlS6h46t+aJmpoNgV/PUxZRreyIQEownxJ/RZS5TWmrQorUcWq
	wjxgZp8sg3WwlqDeLFVs0ZvdyxwKOgJRExF4qRFvsGSikrTOUPdCYPLtIRCtsYctLr9Xlv68tR9
	qhXGh+0diP/Gw7Pr7QUbLEH8g2cDN4UPeBhI57SoBizd3HhU3ebD3dBhfMJFuIMz8h51Fm2E12L
	W8b7IFZKAcgFGaDEYAw2QhBQvt5RSK3oKw5hlMT7sMwn7DekbVYacOm/D/l7WMQMm86eS8hyoZ9
	vu8aS+0K60BaVwwTGMWwArPR+NaURS/yDTg9hkIN9+/CYoaaANq2kPzI+/UO9Y1h2rz0h1xZKVm
	jm5bpdH4tv4M/dl6y1QYbIGwg61q6DqJug
X-Received: by 2002:a05:6a00:4b56:b0:88b:8701:b869 with SMTP id d2e1a72fcca58-8a9bf2406bemr5756716b3a.24.1793611093454;
        Mon, 02 Nov 2026 01:18:13 -0800 (PST)
X-Received: by 2002:a05:6a00:4b56:b0:88b:8701:b869 with SMTP id d2e1a72fcca58-8a9bf2406bemr5756686b3a.24.1793611092908;
        Mon, 02 Nov 2026 01:18:12 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadad94a8esm1710055b3a.55.2026.11.02.01.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:18:12 -0800 (PST)
Message-ID: <65de0201-eab7-4d03-8b00-af17e2907856@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:18:06 +0800
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
Subject: Re: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
 <7c7cd421-81de-4c5f-9e37-0bb3b7bc5974@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <7c7cd421-81de-4c5f-9e37-0bb3b7bc5974@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GpwYwoM4BTZnstLv22NmJaJ7gGlITQQu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX9kI5vPFXpCIz
 kujzGutb64PIAJ0O/wSHtzqpEEQPVGmn1Uc6BR7VsbCxg/3FRZZmKqFvgjkB5dJk7twOu5bwHiF
 jtLnBBG/wXg+vrlAAkGflKbvJ/108Go=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX8CT2wDD5J3MW
 VC9cJi/uIZwGgetVcU0km1HGif14OmSRNWy0zuJCNZkVbS2dbXVTmHW3ymA3/FQm6y2GpuiOkCw
 lt4nw+G8frjbu5l+Acic0HP3gxVCUwCPV9UjEfLwwin23e0X4ltGTGPzSgcqE+ppZuNT9NgdsGC
 2MIs6m8fnmU3rsEr2ldwBcg8DCmkJKCOCGQ1gR+uTgg4/meih3ufMqrLzreBBrz/8xXzD6tO9Fg
 QeOpLUzxVFlFY8msmSB1pt4DxkYLU9Cx+jzFQMHX1yZcyKCavzJfbZeByYhs0XQPx/AmfxZJ4vl
 I/mPWrBK9/+L6/+9DN9ECkHrLgA7wARnZ9e3odBlqaxUtYCPqru01h9TSGSXHtSUJdyZF92G9EQ
 naF+zxL8M58fvE38g2BhpvU8CExKlfBu6zfs2Mvd4XKj0JPcGg0/6I4TJibX16zZxdK2+y0ea+E
 tuYaOTeVkR0bq9oibAQ==
X-Proofpoint-GUID: GpwYwoM4BTZnstLv22NmJaJ7gGlITQQu
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae85556 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=J83HQVenGjWz2Msjj4QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 7:38 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Add support for the TPG found on Kaanapali. This TPG uses hardware
>> version 2.4.0, which drives test-enable and reset through the
>> TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
>> TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
>> CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
>> the data source when a test pattern is selected.
>>
>> Add the TPG resources to the Kaanapali camss resources so that the TPG
>> subdevices are created on this SoC.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
>>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++ 
>> ++++------
>>   drivers/media/platform/qcom/camss/camss.c          |  2 ++
>>   3 files changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-1080.c
>> index 3d90d31201fa..ec56ba85a0fa 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> @@ -64,6 +64,8 @@
>>   #define        CSI2_RX_CFG0_NUM_ACTIVE_LANES        0
>>   #define        CSI2_RX_CFG0_DL0_INPUT_SEL        4
>>   #define        CSI2_RX_CFG0_PHY_NUM_SEL        20
>> +#define        CSI2_RX_CFG0_TPG_MUX_EN            BIT(27)
>> +#define        CSI2_RX_CFG0_TPG_MUX_SEL        GENMASK(29, 28)
>>   #define        CSI2_RX_CFG0_PHY_SEL_BASE_IDX        1
>>   #define CSID_CSI2_RX_CFG1            0x884
>>   #define        CSI2_RX_CFG1_ECC_CORRECTION_EN        BIT(0)
>> @@ -148,6 +150,7 @@ static void __csid_reg_update_clear(struct 
>> csid_device *csid, int port_id)
>>   static void __csid_configure_rx(struct csid_device *csid,
>>                   struct csid_phy_config *phy)
>>   {
>> +    struct camss *camss = csid->camss;
>>       u8 lane_cnt = phy->lane_cnt;
>>       int val;
>> @@ -156,8 +159,16 @@ static void __csid_configure_rx(struct 
>> csid_device *csid,
>>       val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>       val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> -    val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> -           << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +
>> +    if (camss->tpg && csid->tpg_linked &&
>> +        camss->tpg[phy->csiphy_id].testgen.mode != 
>> TPG_PAYLOAD_MODE_DISABLED) {
>> +        val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
>> +        val |= CSI2_RX_CFG0_TPG_MUX_EN;
>> +    } else {
>> +        val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> +            << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +    }
>> +
>>       writel(val, csid->base + CSID_CSI2_RX_CFG0);
>>       val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/ 
>> drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> index d29de5f93c18..cabbb2638cf3 100644
>> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
>> @@ -22,6 +22,7 @@
>>   #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
>>   #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
>> +#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
>>   #define TPG_HW_STATUS        0x4
>> @@ -33,7 +34,9 @@
>>   # define TPG_CTRL_OVERLAP_SHDR_EN    BIT(10)
>>   # define TPG_CTRL_NUM_ACTIVE_VC        GENMASK(31, 30)
>> -#define TPG_CLEAR        0x1F4
>> +#define TPG_CTRL_CMD        0x1F4
>> +# define TPG_CTRL_CMD_TEST_EN        BIT(4)
>> +# define TPG_CTRL_CMD_HW_RESET        BIT(0)
>>   /* TPG VC-based registers */
>>   #define TPG_VC_n_GAIN_CFG(n)        (0x60 + (n) * 0x60)
>> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
>>       }
>>       /* Global TPG control */
>> -    val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
>> -          FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>> +    val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>>             FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
>> -    writel(val, tpg->base + TPG_CTRL);
>> +
>> +    if (tpg->hw_version < TPG_HW_VER_2_4_0) {
>> +        val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
>> +        writel(val, tpg->base + TPG_CTRL);
>> +    } else {
>> +        writel(val, tpg->base + TPG_CTRL);
>> +        writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
>> +    }
>>       return 0;
>>   }
>>   static int tpg_reset(struct tpg_device *tpg)
>>   {
>> -    writel(0, tpg->base + TPG_CTRL);
>> -    writel(1, tpg->base + TPG_CLEAR);
>> +    if (tpg->hw_version < TPG_HW_VER_2_4_0)
>> +        writel(0, tpg->base + TPG_CTRL);
>> +
>> +    writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
>>       return 0;
>>   }
> 
> It is necessary to split this change into two for the next run:
> 
> 1) the generic TPG subdevice change to support a new hardware interface, 
> equal to
> 
>    https://lore.kernel.org/linux-arm-msm/20261031112203.545319-4- 
> vladimir.zapolskiy@linaro.org/
> 

ACK

> this new interface is for a range of hardware including SM8650 and SM8750,
> 
> 2) the rest of Kaanapali specific changes from below this comment.
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index 6ff82dd2aeaf..df4b4cf30711 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5850,11 +5850,13 @@ static const struct camss_resources 
>> kaanapali_resources = {
>>       .pd_name = "top",
>>       .pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
>>       .csiphy_res = csiphy_res_kaanapali,
>> +    .tpg_res = tpg_res_x1e80100,
> 
> It is closer to 'tpg_res_8775p', at least the proper name for I/O regions
> is expected to be "tpgX" rather than "csitpgX".
> 

ACK

>>       .csid_res = csid_res_kaanapali,
>>       .vfe_res = vfe_res_kaanapali,
>>       .icc_res = icc_res_kaanapali,
>>       .icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>> +    .tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>>       .csid_num = ARRAY_SIZE(csid_res_kaanapali),
>>       .vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
>>   };
>>
> 

---
Best Regards,
Hangxiang
