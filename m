Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A97D395266
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386045; cv=none; b=oIpD+ynRdtgRHoPJJraIOHS8yhZhtzp2lodLMSCOkpZgYvs4CdK24N8WPpnKbzX6uMncV1ou1zV07FcMUvcVDk2sTJq9q2iVZUbDGkalNIdAFHZbKrpHs1wfD8eNF0WT61czlrDolg/iylWOOc1qqyvoqCQEpjU4ebBHysDtWgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386045; c=relaxed/simple;
	bh=BvAeSXFcaEHMYDX/aHwX+oC//m2Whag4iOOItU+Ua5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGPOF71w2/93M1thf2fQNGh/RA5nHggkdL+P83g07LUZ4aIuW6Wj4jNvg69oQdfj24zl1xYVT5JB5e6VykzzOFnJeNrCBZk9PrEXg1mjTfvTVOlDmtpseR/TjyuNKNGvnRsPOfZkFSMsWC96noCipbJsLbn/Z1EAq8aE6MOogpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2r2GSFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBTXPJvs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2r2GSFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBTXPJvs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M7xYTD241556
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixgFaWMtTepO4gLbmMMX38vNztEM0kATGrTcu9nPZVM=; b=c2r2GSFVGGMzmj30
	PmvPuhHwEiXt+HcTHPEgUYurPsG2/3X9EAJSeQN5kVp+IBaQ7r/FwhG1T1JwGpuF
	Tb5zPTorio1D583PW8LAbgBQV5+gMWrywMNbAM8VocmB9pf/4ufyOmUmwPah7Kza
	wWk6D7ysTnYjpmsHa7Q0Smlq5SIUr+pdgMGicWSgaA05Dmc8AG4cZVAtqtuIr3hU
	gw7hksaZp2zcF13HgvGGHE6jnfP30KGsYxA7oBSLnkFHa/mazlAo8DsSNjltju7P
	r4bSjU6S96QdKUnHUqAY/8FuWOzGhufRByD7SLjdRtXAtOrtsn9svMcBXztYeWRR
	/1Sbfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7456rgmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:07:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso21864861cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787386042; x=1787990842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixgFaWMtTepO4gLbmMMX38vNztEM0kATGrTcu9nPZVM=;
        b=CBTXPJvs0NLHuoT1lNCcaJ8+FkagNxTyYhxEgIc2PkaGXLepMqe/0uKqFrhRyNTQyU
         SOVmGsDZP79knND92t0R4Lr9DfqUo9oieSr/BVLYUfg4alzCXsypjnoAz8svsV+Dtwi9
         SSgmH7sTnAdE0t+scbS9Umtydtkxt5QXxDvg7DG9gM5zDt6d8Ma4b8grnFejl8LC2PP/
         GxFfo2or5+KJNQa8AXk/3UWPAq3diw8L8vI6oOHv3DLvxWWlqKNssNzO0BqMLTuwtbaV
         oYlvcNFLGN3t2BfmX7NOuLKFty9URG0+I56wiuM4X9/ubBC/NX8cPr6Qv2sMwgJ2TPLk
         BDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386042; x=1787990842;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixgFaWMtTepO4gLbmMMX38vNztEM0kATGrTcu9nPZVM=;
        b=ZQEMSO2MiQKxbthQhqS68nDCwVY33elvLWmDrLSDA7y/ONnmsqwPZiizlwr9c2P+hF
         vr0Ci0/o28rM4/V42gf3XIIin7Ho+yA3TgVWsDJs2p0JvVZiKeMtG3ZIf6pL9uZkc7pw
         2VGdGnuMhPDVugZwWzKLGif8P1T5JQmGGtZfnOOH5Z/vnQOvnwdZYxKyVE1Fn7AbHC7T
         +mdK/0/lCPf8TTOcDAgmbYxjq69iZPQa7OsgGuajeSjhaQhaeICo1kYu2jTiB45vR5H2
         jfgznNHHDpJI8mnF46uGx/tCpTSsBUbDfaYnPZ0IrSQIhhTC5EuvbMKPfXTTiJA26844
         z6GQ==
X-Gm-Message-State: AFuF++lUYJ/mD7ewNE83PDfi/iN7DKJreeSSbljNG49ymAyI1RDcn389
	VoGyLEE67fA9GWwOH8Jqz9U22i6vbmHMPJUNxaE6YqOsWbaBWmRPepsJ1li6g6b4l3P4LBzpw0P
	c9foAFNeAuzLzdByFmdwCtm4paIMkW58NumFpJ0BmvhZmvhDvVP3d0DYb7BeEdginrE4M
X-Gm-Gg: AR+sD11MrrzxwRqE+T+O5glBJ9Z20n+vh5uBCE0MVLmLTbvGbtJFPX0dHBy+9TVWv+z
	luejvApIM0NDx7W81ojPpltoAerRz8t6qpr37z+ayB78wGtE0iynZdTafCUn9SCnOdLTfLCv5jL
	mfb0fe6yyUs3YpcFe7S7JEo/CJyX8j8Pn0zFMiUBzYCdamUMeX1iK9cSUdx5DKDosB+rc790cjd
	jZXh5va+4VcUwPuYNg3cLL9XzutoaoOHbF119wxxRCtxe6MJEOYIhJZhLFn5O9yFRSwIEkRIjsW
	rNNWFaJ+fJ+mAu6O5IiNMH/0J1MvjhJPye92euJRV8PI9Xz8umnXHK+wUYCVK9wiRm+N0hGMgzj
	z9/dnUlc8igC/JrxtKwFHm2oMY9O5
X-Received: by 2002:ac8:5cd3:0:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-52df574715cmr114738521cf.17.1787386041922;
        Sat, 22 Aug 2026 01:07:21 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-52df574715cmr114738221cf.17.1787386041474;
        Sat, 22 Aug 2026 01:07:21 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496866c4csm234826466b.54.2026.08.22.01.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 01:07:20 -0700 (PDT)
Message-ID: <8b61c2d8-054e-4bf6-9e71-d222104a1af4@oss.qualcomm.com>
Date: Sat, 22 Aug 2026 10:07:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] arm64: dts: qcom: Add 3 new devices
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA2NSBTYWx0ZWRfXzQZ8rMnYE24q
 Ft4hu6aQQibpjWlwSR1VTnpjpewDMAljM1IwBsWcR23HFheaUUFKhq+KeZh4Q6edlc5deVKJPoB
 +XMi2ddOs/0YQjzLj3Z7/5jIbArv1/s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA2NSBTYWx0ZWRfX927WL4j27NlD
 C1TIzFhbBopUQOENp/0Msk1oeFuCXKCKcVurkqVx8w5EBe46JFN1WpkLmfoAZfkGVIQSVAyu8Dd
 E2fhajptkCxUfz9jlSobJ/hm1HV6MOO5+VvZGDvh8xv0nZ+L9IbM/nVDlV+mz22gIDHk8CW8e33
 hEGf2GfBj7atPjId6qdooA13wF8OgEdZllmWmHEv+UcIVrPUZIPkQGXgLTfUYzVFN3QQeO2E9aO
 hiLFfdSp0Dqo1hvvdoaScDZBXpKoqPL6WYiQzAUiHLnlaCSRK+kgdrbDf6HqwAqhs7VGKJMiwBm
 NNvg/6VOMl/fiFy8MdWOVp6PNGo5EqRcKo955VXwAGDRO79ncB2tgt4jLwxvZ0aU8comMSvw2qB
 TE7tbWlqHBUy4tp3xryNuNfhrAr/hUFu0NCa4JZMuq6GbJIhkGnKvtb+4yc/jWlKxd1iiHosLXE
 9kgIAE6Lc6Zol1BGblQ==
X-Authority-Analysis: v=2.4 cv=RtL16imK c=1 sm=1 tr=0 ts=6a8958ba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=78WjNs6xVlDubrzIrP4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: b3tH0Q4kwi7zNrCzu2mp4gPWMzAHlXpz
X-Proofpoint-GUID: b3tH0Q4kwi7zNrCzu2mp4gPWMzAHlXpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220065

On 21/08/2026 14:26, Adam Skladowski wrote:
> Introduce support for 3 new devices:
> - Motorola Moto One based on MSM8953
> - LeEco Le2 based on MSM8976
> - Xiaomi Redmi 9T based on SM6115
> 
> Device trees besides enabling most of supported hardware also wires power to
> subsystems like MDSS even if those are not enabled to lower maintenance burden
> on out of tree forks.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

Three patchsets within one hour. Slow down.

It is one per 24h during normal cycle and some maintainers prefer even
rarer during the merge window.

Best regards,
Krzysztof
