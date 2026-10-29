Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261827;
	b=eCR4o/s9cwUu3gpqHirPrV1+M5JABKuIyM/gufFsNWMTyfZdeM24o7VDcuBYnzNWO64a
	 8ycMfrDX8nCc1wlzhDUBJuheH9r5ghWaC8eC9bz2/Jf30jCOEnY6G/1xMVTbQNCc1KWED
	 VgmwmU9eUQ/kXTnAHA28Uhc+PrEVIo1jja25VJIPM0YzDVoeFtC/AtXfSakrNOEj2/H0q
	 REt+3HL+mvkS4jzqj5JOuK9AHnrCcolmZy5WKeY6HUSajkUElZ4+EQ/drs7RbdlG8lOJb
	 7kHAUi53ZhkLVVbn0xxH7f0mD/Fs2IpeCv7YX2u4r7fVoi9ic+QlpGpfAjd0FF6YG8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7ObgK3uRV6cKfVdCWUDrdbBkGrdpI/d9NpKlEYbNlCY=;
	b=Q4JWXoaTPfWWwe0YXIBTNhm787rQSJfLVfYy/IxN9BEOynPFrVJoPTByHGjo8J9nZxNz
	 dzPH9HZdzV3SN+ls8Ap7L7APGfML+H1ZJE07rDQVg+KuxWqRJDNKxrOx7bLoNi8IwgyU0
	 dEiylxvURx4Eca3u9PJ5czkfHd24wtmrTXsIpD2b9abgRPwHv0ZLz7jd/EtXGpeb4ct2P
	 51sRdqyCHwvW63EKJ+t0cGqUyR1Nje/GVUmnUmWafhFhVUeZg001aumzAokQDTudM1+2+
	 2vfOhYrxtFm6EvDnWrdqhXlq3s48rGjm2U0qjR1Fr7ZZIebWf+gg16/qRqDGB3RRa+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+v2pR7d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBxwOj0v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE2260A2605
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE2260A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+v2pR7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBxwOj0v
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GmpZ204330
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ObgK3uRV6cKfVdCWUDrdbBkGrdpI/d9NpKlEYbNlCY=; b=B+v2pR7dsxQThfZx
	3QRMLymhTtIcqGnFnLyXGHkJbnbq6y7tpz6Q574+9/GIpEDUkQEyTy4dajednGk8
	vJyfyFcfLWJjYmOHzde1tnW+cawHnUAj6lPDREGdbqSYTUVOvUiLD8dyg35bykLi
	MIicIhyI8929VKnZ4L8cfchr5oyfGyFkZO/l6GkFfxv20+rZtCgSFm9DssRflYIW
	Mmwcy0YKlJLhFVc8PzBCZIbtrhqGHJkA6yuZamFB6Fx8nRE/2/d//1abwZJJzqxd
	Fc51x4+zvTbfTxHj32SjtpF01nYIC3n4H8AG2mfbXoNqUq7FWsLU6TSmFpR1xjbj
	b5payg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneutxwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:17:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c84695584so3220646d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261825; x=1793866625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ObgK3uRV6cKfVdCWUDrdbBkGrdpI/d9NpKlEYbNlCY=;
        b=eBxwOj0vENd9D8/fdkw9NSIuAVDs5RrxbMDsCtyVNXqT4a60n3pTKjh36gZUYnX44Y
         EDNfTxjownEwwuv3/DxGqiYnWFxOYm9Pk+JLzQAii5P2vb16WEBaxHFfVCiHdh738+dv
         M0xN+K5sxQesinEccHr91kKJF/3ksF3I14INlxZ0FHAIkj/p3SL5O3YG7M85rTjDGZNz
         47/jq6K9F+50e//f9MQdLOo7vp1cCDTS2oIKhS6AlTeaBtMvDW/mA1I4NxQQ8eGuLlMQ
         PfyB5tz5mDSbSt0RDM9iiFdwgsuVwI3GQMzH5WhPLro9fwaKk4fTifSRHHMfVjHrBt4T
         F6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261825; x=1793866625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ObgK3uRV6cKfVdCWUDrdbBkGrdpI/d9NpKlEYbNlCY=;
        b=GmBPX2uBfMvS6dOsAchvFNu/qaVRvBeFwvMSM+lEE+Z9IqGTDr0uzgpbkTTsVLYdPV
         uvDcv7UVd3nsQAdOZ/UIjjogmUJ5zfmWTXkZZk/5v7lEOHRs4TQXI88pTmRV3ev6PAGT
         TbRilCX9iydwTqopjmSqrSMnegTnDAv9h5qA+n96LwI+N2pLJXQwIKpfx5/425ejZ4w/
         UOZy8s/pnKqRlLQdh1/W5zTclKdQswwpj7tU+83OiXiXn434Kj+CS1tUOtCjeZ/YhBj1
         Yz+L4dXUBFKootTdlzSWcO1GQUSoRohKCDoq5DoF/rYsI7b+UwLCnOeFGT4k/scgbNYl
         imrw==
X-Forwarded-Encrypted: i=1; AKwUvBy+1C9yJ9kDgmODzDgQyNtdq2aee2SwYUCGRy5jgyuI3VD9sRbRlsW1Nf+GdUq9A/TwIjY6wWSRygl0/sVB@vger.kernel.org
X-Gm-Message-State: AFq9FYK+vjWwOWVMqoLyu6Cwime+qrQAscEb/AwxwdK+eHAnQfD/fRmi
	/BCAQbYVLpkzJQQpsoIJyu8EHLMz9rru2YsqP59Gj3q8/4etYFixAhQN7Ln5aAbGnSkkXe4zNnq
	GRqE1uq9Ge8w6WGm1Elx7VKbwJlk/TrwPxbrCf/zHctk/8OHsaj75oDOHI/vbd+N+XesV
X-Gm-Gg: AYBFou2JQF9f2eJu8GxK3vDEBMmhwM5WUvS1DOz3goRhZ8ISg2ZbsYVbnb1ZHY2P6W5
	elNeZBWy7y5WG3owDfCXkK1SJAm0Z3A5tWoF6pJEXkpuOyHHx00qaaRDd7ySNuiH0HR5EigBOa2
	AA/WL/5KWDOQ0t45s4R4PP47a7E+hydyWOZZ1pSpPUP40UoL78uMI9ArvFv4uJhHwnCB33m2h+r
	35h0oPHW5zOpPPMBY7Z/FYx26Hn1T4dmkxso/5p6YPFoaG8IMD3pADJ2FI6NhJ0Grkybp8kGYkw
	D+AuL5GWwUcKWch5Ih9kF58PKB2GlzUKmEO+fkAWktTHvxpXn2Xxo2gyv21T6ntpC1napXNj2nQ
	JrR2EH3akW+jxzTrsYqzpqAkc9SjmY6adYfO7JdoT5KXdOXfCKIBwua25nWux29pmkZ+3Qsw=
X-Received: by 2002:a05:622a:e350:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-53fcc9bc5e3mr77695661cf.5.1793261825251;
        Thu, 29 Oct 2026 01:17:05 -0700 (PDT)
X-Received: by 2002:a05:622a:e350:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-53fcc9bc5e3mr77695441cf.5.1793261824787;
        Thu, 29 Oct 2026 01:17:04 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd35004asm695139566b.4.2026.10.29.01.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:17:03 -0700 (PDT)
Message-ID: <c5cb80b9-6a5a-4762-8a8e-9819a09dace5@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:17:01 +0100
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
Subject: Re: [PATCH] clk: qcom: gcc-sc7280: Use retention for PCIe0 power
 domain
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <CGME20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f@eucas1p2.samsung.com>
 <20261028223444.2683120-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028223444.2683120-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX00had0FJUSZ/
 qBgy1RJR5J1unmRR/w2/yQHFHNeyOjvJw1wCazACHw5nWt8lLznhtzQFt0+fZoqCny8IL8RVxSe
 59/Ka87Al0C9RD8g+//VzcwZwVi9HOHv2V/05zN0CKYGCPT+udYyhg9GpwawdZbjIN8TdKbAfWS
 xciusB80QJ+Pt85VA77BNbhBc0TxhxFK39PMZVD54Ng9g2cJeLmN11F5JMYzSuKNF3TraNQ4JRn
 d328Nz4j7ToS3+nvxxejSD1+oWyog0RdftVrrLsT5aB8SvBTAxmSSr4k2sMUOZ2jN/dvcnvdXIj
 h32CjpbtUdQn5q09XOL7N/xlsnmVMBbpXSZK6aKXL2dkLnbCG8td4XpnzVvxJbhFC5yU7Rp6U/+
 mYb+f4Lci+YnwUqE+cxDqCDELwThdjYbE674fhUM7xabGyyFnFA6nMILPwytTOLWBFW0cJihDXy
 YNjhNxcIMjTlJ+UI3xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfXxuQWay4YkVtj
 3omYsNKLH0o+0FXS+CWlggbDlMi0ziVA9UwUk/0jRzObrUJgv+ugp2hHwq24AHnuYnpAkO+uyGo
 rljMCTP0ZrAkxquIB5SlrESlYBlD18c=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae30102 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=NePJl4asqtF8pCtaxCYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: yahUlcnIu_g2j3AlrjblhD5lkWRgwPpG
X-Proofpoint-ORIG-GUID: yahUlcnIu_g2j3AlrjblhD5lkWRgwPpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290031

On 10/28/26 11:34 PM, Marek Szyprowski wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, it keeps the link up and the resources on
> when an endpoint is active. However, only gcc_pcie_1_gdsc was switched to
> retention by commit 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the
> .pwrsts for PCIe GDSC"), so gcc_pcie_0_gdsc is still powered off during
> system suspend and the controller loses its state.
> 
> On QCS6490 (Thundercomm RubikPi3), the Renesas uPD720201 xHCI controller
> on PCIe0 doesn't survive suspend to RAM:
> 
>     xhci-pci-renesas 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
>     pcieport 0000:00:00.0: Recovering Root Port due to Link Down
>     xhci-pci-renesas 0000:01:00.0: Controller not ready at resume -19
>     xhci-pci-renesas 0000:01:00.0: PCI post-resume error -19!
>     xhci-pci-renesas 0000:01:00.0: HC died; cleaning up
> 
> Use retention for gcc_pcie_0_gdsc too, like it is already done for
> gcc_pcie_1_gdsc.
> 
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
> Fixes: 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the .pwrsts for PCIe GDSC")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> The issue was analyzed and the patch was prepared with LLM assistance.
> The fix was tested on the real Thundercomm RubikPi3 board.
> 
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
