Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833256;
	b=wAc3JFxQ94de5b5m855J6DISyr1LZdtH2RBb3UHykl2cNdQjtWJegbpgZxtiV255lpnO
	 Jfo82f6XrzIYDW/ro+e3VNtXSq58WHD+Gi0tNEPoPCdL/EGipYgWC01ZqMmzcRhlZABf1
	 Od1PcLPp6r7lhOjJ1UKXqdnl3ebMoi+tiuX8pv+2TMCjVuYHXAim+LSI8reqg55QRBfIN
	 4w/BQtVMZLjijlilLUInKF5R2hKePLugq0pJGo3QWSgKVEY8MVXnKFuVWRWfVqv3oJMze
	 4Jw8dHX6z4YjS9rOwnav9Rg5FJ9i0jPfHWgIBHLByJD+lhvWV888GpC4u/5VvseI5FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IBnwuUwFwWPHj2qGKuZXR/Fn/5DPhnAAWQsAJFP7dnI=;
	b=KTuhYHqNRGtcVof+RM8UNuCxvcA05hqEWsjm3bSPLI53olwFfZUECGGbdrlYzgzzoo67
	 4BLcBRbv9r0MiC3k/rM+TkSu6PtxRxzg6ASXBmzq9h3gaUVgdBwRztHIh4spYzeFz4+mi
	 HFVbZ6Ei5B5Vq3m2wq0n365Iv64s1HrPokTUTsuOZkZsUs3BS2ADnJTijTP+kFPrwf+oU
	 RJTEX5rvkQzWnHOnTJtBcef3sksy3jO5vHHxYDnVEqcpC7HpKo36WwKdQxgNZXRt+TnYD
	 ij+16tm3qs9r1Dvo5+R9jLnjus1xaVWV5XU0bGrn7mW3KRyZAuRXbSE5hBBe80aVILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O6BGli/H";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uh12jnc7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73121606A326
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 23:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73121606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6BGli/H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uh12jnc7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4M7V9T3208838
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 23:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBnwuUwFwWPHj2qGKuZXR/Fn/5DPhnAAWQsAJFP7dnI=; b=O6BGli/HIIDofw67
	rFsGgLtdJRCXoEeKzYo+hW4Hh/+ESmUI/61hl2a32FI3wQo0B204FbGWdZCEgSfx
	R7Yso3POoccwvj88TwcTNhGbBGLUAcXof+4KaNXqqphJ3LHGU2Jays0rgeHs9QV7
	jtdag5gRCyqBBYiWubLFbXNkE/Of+86wInhBxp5jq+VzZ0+B+py/7IEoj3AlNUXx
	/Y2b519enVLbpEYmZzmRnl46NuSEOxvMBqNAhQBp/AWv0HB0LTvZGBX2NscBrXC0
	pdSgm61w/feHrG6yq/6N5z8UxShVNs3t2scGaKsub1gx3ChDfA0xLA0zp9JO32yN
	AGHRlw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj21su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 23:00:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2167809eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 15:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793833254; x=1794438054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBnwuUwFwWPHj2qGKuZXR/Fn/5DPhnAAWQsAJFP7dnI=;
        b=Uh12jnc7wEs+c91B6UjpHc+p4kac6FH7u5MnrW9kYD3A/fewYfhx3eBtoSQZac5mrm
         QYFUZcVv16oMl+t3jCUfQUbY8p6/OmbF723pEvl5uIEqCkbGvUgtHR5HZUUUB7MKN9Mp
         urpYExmNjHzWkG5Pcgeyfjy+skZF+NDAGTCLMIwR2Er93Jk71IrbY7aXguzsMqoyo359
         CWvuhZw8CxUIxMCkmlyAbpFSEN0VpILD4lREyerKsrdKQ+C9dIi6cD4lo7KOnFUVOEya
         DzvldJLQ/oNXYFfEYl99Rr7+Xk8OASoaV8KwkTd6Jyt69+12xcX2w/ujaSmo7UoTS+59
         HTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833254; x=1794438054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBnwuUwFwWPHj2qGKuZXR/Fn/5DPhnAAWQsAJFP7dnI=;
        b=zgtu+Wmek1oQawDyUqzMAXTP9g/J2qIa2cDU+jYNTPiaR1tdmb1uKbI0Q7iYTmL00y
         0Nnk4T1qEqFGL95/kxUCnX9rmxzA+8IcPjKnt6ERGXYazjTN0BXGdvX7DFjU3SwGlB29
         yg+LV3BN1KqFDqdXTQGfXvQ0+MCqerz91rnn0UreWESBvGJCInzVTaxjFKYXooz9hIq1
         J/gnOoW88e07FbsJ6jZvRM73Fym6UA4X/Ce8R/1yOfgwDvnOVdpS91U6R3ZYcSoWM/9h
         uKfTnCGIP11GQ78EcHo7/26uwvv8lofqZBtpq81XkxdY3p4ulmX7Ir7V7oM3vsP/K4+X
         MuZg==
X-Forwarded-Encrypted: i=1; AKwUvBy4hxNAtaeJMj++A7dw8cDcwGq+y023RYFIdT9crC5r+CzhG7KV2KCLHOyiPYyKbt4Ms5wlKiBQEpQtmozB@vger.kernel.org
X-Gm-Message-State: APuU4Z//nit7VeIsnl3vsdJP2fiHFRGHawLbY8hbMBNIy98Shy4ydHNY
	NUAfAFWO1798bk+4X/2HKwg598JlQA9zGcDufBT+pEfVTCqutOila6aW1iEUa9GBM4jnHMKtJ3/
	3UIoelbkeByeeQiIwmi90J/MB4mdYEkszi8t+uonFXeCJWiGGzfQ4l96rBoZe+6sC7idp
X-Gm-Gg: AYBFou3/fKM4wRmbO2KpiRH1D6x22r4dTh06x6/za5HOC1eLFMCMg+rswwfCmXzhmSs
	KRe9PUBfr9OOxxooU2oPDIFZzwSFCFq2gxAdOa9nB17469mBKJZZHZxT7OMsL4dByfXT//aDk3g
	Fvkdh3mzOuSy0XYN30pov2D/1cWHKPSd3LlOtqkEKpQa6vi85EYfKKkJYRBaWWLSM6jQX6ffd99
	SVdW0DIotajQFat49Zipy0xAb2g0qqfC8Cw+m6NbPJ6cxNX1rqQP+z7mUESkfpQqf2tvLr41TFu
	JoiPSu7nvIGQehYptiHcAqExHGvUQefRcM4ipzGujDdoLseWk7mPbrW6ftqMVmifcn8AgViS3On
	8pYucQb8Cihwxnb2du7xRxtXC6wKUw+H43Dgvav73ZG7kBhZhs5KSCrHDHpHvRd93doKii5Gl0/
	J2M5smgs7UD3UH+9D+om8QN+5f3hLi
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a423c6223mr26622413eec.14.1793833253674;
        Wed, 04 Nov 2026 15:00:53 -0800 (PST)
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a423c6223mr26622351eec.14.1793833252836;
        Wed, 04 Nov 2026 15:00:52 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39972d4sm17734198eec.26.2026.11.04.15.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:00:52 -0800 (PST)
Message-ID: <adf77ed5-ecdf-4984-87d4-a7f796b83c2a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 15:00:51 -0800
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY
 common-phy providers
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikram Sharma
 <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
 <20261103221026.3662383-2-anusha.nandi@oss.qualcomm.com>
 <72223121-cb42-422f-8ce5-4cf9f41c5aec@oss.qualcomm.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <72223121-cb42-422f-8ce5-4cf9f41c5aec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA5MCBTYWx0ZWRfX9IVFLrLOza1q
 AVhhauubkfRxSZuOSUrapd9ONsFQUNcG/ZonO51kvO8uUJLcTD2kRmQ0B3VubCW6J4/uG9gw6uT
 Lc08hp36ZipWxLWzzdpP8xU2S408W2AjQNQyq1/b0Cq0hAPcpScrhmLyHzUUR5vfYImSilFxGAM
 LwVRJoJ7xUm2Cwbq2LkIbJU1xHX2G05O7Fk64fPjnQgxPE51XwRCyB9VzjTmCeW2Sf9NR8grLsD
 qJ3D4Nnqn19pSjRt2r8AL6kiAcFIZD0bKXMC7ziWVYT70Rub2/AOqtwlhWRx0vCeeCgzfZabr1w
 aaC0HE5BtarmJUI21ktQzwdbuYam43t1qFtb2qNco75qiJtvFmujKBb9HuOyuV8zw4bh4VaigjK
 otA1KfgUsfNXTNWNOjd8mvzCE2jpk8VWmVUKPLYUwJx12rQa+2fRfeOf+uxerMtRr25q/MsGm7S
 oul696bF80MdyQyqA5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA5MCBTYWx0ZWRfX2j1GHFxljSuK
 qc8rwOnm+GSTTFaGkDt6aK1JKLMNDz+lqQAOwmZQq+gwi0m9BTdwz5oL1j38eMQWv5qiBl4WLyl
 0rPu0KUXGhcDiE38yVfpcl7soYsbHQw=
X-Proofpoint-ORIG-GUID: W31YotC-u7tz_MxnJYSAcxPgmCAsKo1C
X-Proofpoint-GUID: W31YotC-u7tz_MxnJYSAcxPgmCAsKo1C
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aebb926 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YzLprhzs-1J5OMutLZIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040090

Hi Nihal,

will drop a new patchset.

Thank you
Anusha
On 11/3/2026 8:53 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 04-11-2026 03:40, Anusha Arun Nandi wrote:
>> Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
>> generic-PHY provider nodes (csiphy0..3) at their existing register
>> addresses, each with its own OF graph (port@0 sensor-facing, port@1
>> CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
>> once a board wires a sensor through one of them. The camss node's own
>> reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
>> that don't use a provider still get the legacy binding.
>>
>> The provider nodes are disabled by default; a board or camera overlay
>> enables the one(s) it uses.
>>
>> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 140 +++++++++++++++++++++++++++
>>  1 file changed, 140 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 1fdb72fa5518..2a30bf1c82af 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -5164,6 +5164,146 @@ cci3_i2c1: i2c-bus@1 {
>>  			};
>>  		};
>>  
>> +		csiphy0: phy@ac9c000 {
>> +			compatible = "qcom,sa8775p-csi2-phy";
>> +			reg = <0x0 0x0ac9c000 0x0 0x2000>;
> ...
> 
>> +		csiphy3: phy@aca2000 {
>> +			compatible = "qcom,sa8775p-csi2-phy";
> 
> phy@ac9c000 through phy@aca2000 nodes precede the existing
> isp@ac78000 node.
> Sort CSIPHY nodes by unit-address numerically.
> 
>> +			reg = <0x0 0x0aca2000 0x0 0x2000>;
>> +
>> +			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
>> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
>> +			clock-names = "core",
>> +				      "timer";
>> +
>> +			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
>> +
>> +			operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +			power-domain-names = "top";
>> +
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +				};
>> +			};
>> +		};
>> +
>> +		csiphy_opp_table: opp-table-csiphy {
>> +			compatible = "operating-points-v2";
>> +
>> +			opp-300000000 {
>> +				opp-hz = /bits/ 64 <300000000>;
>> +			};
>> +
>> +			opp-400000000 {
>> +				opp-hz = /bits/ 64 <400000000>;
>> +			};
>> +		};
>> +
>>  		camss: isp@ac78000 {
>>  			compatible = "qcom,sa8775p-camss";
>>  
> 

