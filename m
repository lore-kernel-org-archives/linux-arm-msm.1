Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571863;
	b=NCjV8Uuwk26PAmpidnk6FSREwr9mIv2Qj/YqBmWuaWyDjl5LoEwj4kSjGrzYF2/z1Wjo
	 STyUwCQg2wYPOyBjoM0d6BJ1Siyb6g8FjGq9yXyo9oypQ6aWdM9DBffBZnfK3tiFAjGrd
	 hBX+tasgbUodSuQ25ATqaBOqdDnyjwET1vTqsHppwHYTepo9OJbeiHLXPL5K6BdJoRAtq
	 YvKCj6LrjyhuMUufh46FUVUY8pIIHemWBC9Vm4FQXHzmo7IpqivOJoayNdB7hp9/+hz8s
	 IeZGl3oc5Tb6d9BUG4RrCBddaASW+Aj1KO+WG+l9EQcCnV5U2jVwtJepNIAI4cQk51g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
	b=pphxszUUYYiqL9R0x9nxd1CLmzZ7aVVpSinacfLQcwi3dhNYHXTUBOFFYhB2AzFm/9vi
	 Be+tNNfNIkE3hO5Qwbto8qWlgWyFtPdVhTk485uqMIWMIX3JuZMuXpnagbiIDEOP9/PQO
	 DmgYN2rC3wDSvPIgmbmfDElo+O6dSLAMIjjhdG7PcGUTxeYsGIMwj91wMT5lBn/49fEjH
	 rIWmhuM0OAJy7AtImohLzNtJAqH99gYRFnw5SsQOXcZV0Npl9qp+qBGNQ5/0iE/2PY8kx
	 tyBRZBSSCbt5Brvfhf7fXS/I/dw4+jT3mGQhcZKboWNYeoxD0PorSwNQ+xrn++cYCFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gmBZxwg/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D31606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D31606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmBZxwg/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC1FB92085732
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=; b=TEFiQ7CgOeSRnQW/
	Se5AoZ7dU6cjjcaKCcUCdHvC6glfYOpUgtIi46FqA8lPXUVJgojFjfTr5Twfu4Mp
	CQbbN6g6pHf3PwdXgHahKEHyyYCJvFy3uK1ZrPlHyfhXCDZPXP7l2zI3/X6YRhr9
	P4cuWfILX/CScAZSIlXC+90djbPnxUYlMfurTNDWM2n9N5nRSr3Zm+vlX3pnFWhZ
	As8+Ov7kfmMtzFJB0joQo73uFu88E+LeiTT/JhxBaznhr2QHYE+waIvCpoMzvaU1
	mUm3VHg+zCXtMTkhyvJzq0nOEheAZ9Jegsrr/fM1r+Ndg83P6CJP2LKdzamirrDX
	+ZsSTg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r94ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:11:02 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecbb3b4696so50959e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571862; x=1795176662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=gmBZxwg/XbqtrqP2oY5LPz0tR+Xlsf3EK8DvNSJ1rLx9AofPyhzm2VQVvXVe4JZBqx
         OxgSJOVwbJ0o5JaQMKSlltQMxvdvq4J/n21qNljvslQMWk621bEdPn8ttOu+Lbe3UH7d
         +3xKZVHZ/L43kTKUZJ2vU/LUqd+LJrcYZ+SxgNovrNfnrwkRs3rK4WZG2ml2tSK5p+iq
         iecQvJEjCJPeJ+s9iggi4m4wOyMTontB8DhfUyM5I9auPFyujfzSGzZEMHi2FujjyKVi
         VR5uXP6/MOfEY/p8Twe3ZB/IMLUoBomk0ofKmSVtF3tp5YjlI/roFhNUgEOHp0CHwICf
         Sd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571862; x=1795176662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=G6XN8Pss4fPgWPN1ylyu9ek5mQivJTy0aVSllSEgrdlhFVqLeFAtPOYBIUQ2TG10ve
         E/IBCulVScYt6HvwXQ3ld1arun/Ja9MUYDi3YjoiWc4aZYnTM2j6tMUAEQUhuqmnHoSy
         blgc9f6Io3R7PSosae96uWbLnfAtbbaIU44CqRELxOlVxmmpkLdbAQbB+J2GV8G4KW9U
         vIyats9KT6jJQwmKm9rrRF/9Uh9X7zA1N6vd8KIcpx2TqPIJkFMm31My1DFIgVSaOHb6
         4QbinN7NNVO1AhSSNpnSiJNEdbMGjX0vsNhTRKIhXIPWiMGS+Qm3gZCHDR/zcYXwL/GQ
         yOTg==
X-Forwarded-Encrypted: i=1; AL+hErGKKLSBNqvffEaR4HvIVwmvmsSywt2caOISqvZfXqBG5lPm0vA8SXeluLOlNTpHGOpSeABS8AG0TQvdULzW@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qxvtak8d1CpkHAMNAlyOozSEQdjxWFnpoUjeum2bTmvbsCN8L
	39L8ZR6zWHRViwmqeBdLubfNzt36uIPm/hK3ceJdwvVJTlgNOtuAu7sSY9vMBn9bWIermScLY9X
	jh029cF/uGGWJipTlkFLjNiBAYo7HL7kB/dW7LgmDVQZ4K7GEB7Tr8y/ZFOpJ70T/Dg5Q
X-Gm-Gg: AYBFou10yJYV91gNo2aX/95qeRQRhaDi3t/pAjOrcaXg3QvHXQF/pm3OCyeoe4ddx/y
	38O7DdnOzlLATpRwu6/PAcIacXC/usx8hDot7VRbPHo/LP2j7FkPo2i2oYgZe4u6Gej29COxAxU
	1aY54Kc19JZ0jM0MaGUWW0Rt6tX8d3cTBrURXdiYMZsIBSHEb7B8gsDVc8aAvOkw3Q/cR0GqCYw
	Sj9iQOGWNw/kvzq8gf92rvxssilR1QFDGe4a6DFj5hWKXL0vAlxhOdgYmVkVUq5cF4bbMZo+cmT
	E8kxiU//J6uWIBz0aRhMDx0gdqlG7LNRMrlnOb31dfbJ+y30lAzYo4OwNFOCLrvsfN4LtC0/bZT
	rEblfbPV9Bt3Tx1jWtjgDgKkdHVmPh4VSZZtMPl9RISjPF28ofx8sWW+y3Tu2wYuymzymwBA=
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738726e0c.2.1794571861711;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738699e0c.2.1794571861279;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm86814566b.47.2026.11.13.04.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:11:00 -0800 (PST)
Message-ID: <03d75b49-dea4-4736-a662-27ef64682157@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:53 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
 <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
 <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX8UDBmQqfmY2Y
 2z+PkNpzMzTBZNbJcOv/2wVloQRjDAmkCcEjXycLQ7gtIXTOSDqIjc3sQG6AnklGOjWt3iJjcX2
 OlWpBmdcmeM6F/guijIlVTfMBrBihYx6iWgFHY7wRP6iPdRD7HScxtlhoNjTjJwiCMxoxdZcaGn
 aUNw0bsMi/aq/zQ2Pf7HmhrYhaa1RCTcAgPt7OutxC9ymoW01DF4D19XvlvxOlvoE+qxoRFmT55
 l8QXDaN+icCTzTMiQTrS6vyIH10gVtO6qkGlZcKNvInWLx3/M/lPporUHTNGZSEQyvXFELKl5vL
 NPCWC3KBqSSYyiqFAMwLnKjZZgZ3OvgSPgFag/VpuewHHpnb7k7Im5/YIIv57kz3XB/R/lP8zSz
 KAoGb1GGYCb6t1zbIIamcpxOEbMHkvnQ9cJBq87Vrbj0B0DquhAbXUzz3viWgdCfKR4lWPN6DIU
 WVc9liKqAwqIYcMEpsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXx+l3xKVBErv4
 7C7NOCpVLPHxJYplY+/wcVjx3EUy2gO04kiXOsbtmMo7ZDIJhhkfM0fn39+fisUSy6vPqK62qYn
 bRl7m5qWdh12C5xnLNbGoJw/iZ3r/Vw=
X-Proofpoint-ORIG-GUID: 8W5xm-n_dLPwmWPo9L9Iny3pGuJyEEqk
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6fe56 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VS6XN_di3_qKZAQ5k78A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 8W5xm-n_dLPwmWPo9L9Iny3pGuJyEEqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

On 11/9/26 6:04 PM, Stanislav Aleksandrov wrote:
> On 09/11/2026 16:12, Konrad Dybcio wrote:
>> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>>> +&usb_1 {
>>> +	dr_mode = "peripheral";
>>> +	maximum-speed = "high-speed";
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> Is there no superspeed / dp altmode in hardware?
> 
> The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
> port, I just haven't brought them up yet. It seems we need a new driver
> for the Type-C controller.

OK, we can do that incrememntally

Konrad
