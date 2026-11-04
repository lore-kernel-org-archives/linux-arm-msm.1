Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831997;
	b=mVLfUW2CwBWx00Npjeu3QkpZe6VOZ8vr6hD6gs2NgiJqxtxWzF5DlfZsDNfJCUokyOgB
	 LTL9Vx7yXx78OhU/rtr8Ex/8nr0j0RzBsyAJa01uHgIaAg3zEKYZz+nBZucv/l/QyOk/U
	 0wSWfsNoH1Wt1rafaxLNFpZ+eK/sXaiNDG3jP/wLRssEh5FwZY1iq1Pd1RVMJoCg6MEWO
	 pweaWwczIeOe7LXG1rKBPnvjfv076+a7nZfSrPqfwGZVbWruF4yvPIZyXlQicL2FE5nEB
	 QJu5os8/Okjeu9o+BhZH6MsdrjErbDQJjCSDx3n6CY3Oh7FawORNCVfAVfCSwxU60EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831997;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
	b=nMVmppCrH9YJ+lC8sjHD+AVAtukbDFB1EIaAW7tFti2ymPCE30Wdv1iZ7eSoyMENMEw8
	 jE2OuZA02395XUTgR+uURWPF/yuES29X6y5Bp/vDL7PK+D2khHkv8vlmYB1rye+VrQNMD
	 D21P5ty3iXp7gGq58XGiEIompBWny8LcHUxS2ZjigY00RBaT2dQmY7PDqkW9NM7E+VZTi
	 T11XL4xxq+RVKkNUStiCicju6XFIeaXWD2yBGZjajhRiTE1X41+D2WWoJC01lxHIuA94/
	 duE9Jxvv7+zTYNLIOyEkseyJSsim48nwGqpTaUIZOYjynLDZzobozi13qNXySXzv9sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDEmr3Um;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ekyrhJLD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4E606A326
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 22:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD4E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDEmr3Um;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ekyrhJLD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4M9wYU2210764
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 22:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=; b=aDEmr3UmzEamOC+A
	xPEzrZZTgcNgdzsecmhH1CcBswhJqo4oektlcz6lO1H+BUCx//LpLnBC1jbPf2g6
	bfe0uNlQfrLEpRIIHcHRylCJ2cu77HNQkvhu5//NagvpcLduczchdIGRrZ5QFeFD
	VuYDU7lJtSRng8un1Yqwa4F4pY/SC4u/rXgrQrwXZb2ivGFqgbKhMvESs9j533F0
	NO+r0hUyhySwb+4RLPhVmPfPuJ91NW1h7keHYE2v5maUsAWjmisuokFVmKAd0FSY
	j2XPl3QIgXoRTvAB72hXjIOXL4jld6pxHV+m9o8bfIy9czFDqgGiNl6YbdXRgiyQ
	P0LLUQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdt0pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 22:39:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so492318eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 14:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793831995; x=1794436795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
        b=ekyrhJLDv8sR0xdDH7/SGhzlnPA2MUfr8obiK/sFVlNhtglTkYtycIOTHn/aS92/CP
         qIlJaEMhwNaCP6Ccuz/OU/pSGvM0ByzT6P8o1XEP8VgoZR6NO8rMAEPm1e3yOehL0QI7
         1NtLpkQ9vSLLADYlSyZCf6cLPJnKG9lqZnOgaeMBRSdZDp1KxBNqqBaFdFLWlF/TeM8a
         /FyMxmXtzza/oVOCzZrc4FPTORC3m21ACg8tLal7Edx+07edVSKJq/ozROWllnaE9mou
         jU01qTBzYxafU1v7iNuWUP5eS4XULklG9b7S+grWvOqMQRc9vUiARfVylEfkw41tpFz4
         JvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831995; x=1794436795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
        b=iKfj1CJZjBCVvOt2i0AfzjKWCTRVO3vVMSnz7c9pt8AkrczOpOBoiO6iOVJ/jronIz
         zPEDbcmH8L8zg1DigmUSNVLyT8KvC/yf4iWhI4ABBd5kXYvenYtEJMgRwhVN0JUAteCu
         6SP7B4dQBWzx1sCnuiKMsnq12rK9Ya2qswd07/IvO3ifNe2rKrLxy7I05DKu3Y2r5Ff0
         30QvgXYVkFxGAarirq6TkmbVOxbCwJb+0z8UawA3HBMBMac918LbZTGJXRDkMJEYH2DR
         mqP19eHVHhMSOufM5/Mv8joTvR+E4Hvp73OqlilCSRGRUtgQib7CO++opJ/fj8tc9d8C
         bnDA==
X-Forwarded-Encrypted: i=1; AKwUvByGgnWOoLYPSN8hlLpmAG9BmTL8ue/4T50zxf5mlvuZmmle5PDaB7Yz28NqKvXa0gCRz8J2dGS8LsRDX6wS@vger.kernel.org
X-Gm-Message-State: APuU4Z/t3rGpyEYCioo27tDJyeHlSOOVp8bZLfAZawhF7bGO/ZgnigXH
	jCe9YzoZL3Vz65h5SjyhQdFAdGDE1PPdEBwZAbEu2ull8u+MkqFYVq0TlbpxIrJicgJiA3wpK5z
	vbKYuXylyZxYxVWi8XiKE94gP5Ut9/t5XS2/+JKnFR2wwadrU/5XTmRXHN9gvh+yAOc7k
X-Gm-Gg: AYBFou2bBzrWZOBvfocOsHU3OgbF9gq1akqmj1TX4PA0Zl2jjGg144jjEx6ThHobrAR
	QZ52EV7JkBltXqwDc4CbLeIEFiXTASZueQHsz3Xwe8Gj6jipWFCt/FgIgPliDqKbQ0/Ru/Z3Spu
	LBS5nFBus2qKmvV6bKwlMvXACz3TGYZSwIL0C8h2LhbCxSW1fwJM3WD6FfrOPgKxOg1IKeq7rAb
	9X833FTKHwm+IFCB9pD9zY3XrwNLVpx1+ZHhXtC7dX5Y5lk69EX41y7CLnXwVSvuv+hOrkLWoPJ
	BgA9vVNkHvFC1syp4rmJpG89A64IKBOIeqGeM6qYce6xKO+vPcF1m1/KlL3UopDc+6ZQtR9+2q8
	UXNbacGMXlctzvZ7Bfo+/7f8/QeSCovMFtsh1/FOSm/+8g2b87ttAxQQrizffERRFfYONM6D2kg
	mDriIsObOkL8SWZSY3OSGwjeitARSZAA==
X-Received: by 2002:a05:7022:ec4:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1ac5c369adfmr28168210c88.12.1793831994589;
        Wed, 04 Nov 2026 14:39:54 -0800 (PST)
X-Received: by 2002:a05:7022:ec4:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1ac5c369adfmr28168157c88.12.1793831993985;
        Wed, 04 Nov 2026 14:39:53 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3788bffsm10405125eec.1.2026.11.04.14.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:39:53 -0800 (PST)
Message-ID: <8c0c9459-5cb6-4280-816c-9aaceffe1df8@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:39:52 -0800
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
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom: Add common qcom,csi2-phy
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
 <20261103214105.3605181-2-anusha.nandi@oss.qualcomm.com>
 <f319ba87-5569-4323-ae4c-3f9f34a9a3c1@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <f319ba87-5569-4323-ae4c-3f9f34a9a3c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX69Ry9H6KVnLc
 9RRlPWK+ebethHyBaVm96U7PhPJ8Yft52nxPbG3ECOcmvOCI7K2oWQ69mgSRqqSIM6rvvyG1ZgU
 JoNunCjVmnM4KCAFLoeBk3PUQmg7eko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX6gxY6Aa0Zmif
 xJNaKlMl2sUnPmi7jq5C/LaEr2dqsYdiukpM1yBDBhZPxRaUoPr6vK5gN9K4jqhLnA7LkG+2vKb
 +P7C2NAWWeIMmbSjGDvfJ2bxJlG3P/CPZn/kQxJgfAQVCCKE/ztrtoNlRkYa5brErYMLJb/3qt8
 P7jdZaWmUhYxyf1gTbZ0KLStcA/rSCQ9MdpTmtQmPkYKcerdBX+gpUWFBAD8Gczb1D3RrmXGnrZ
 OCvhotCHaWwjDSqDR6YQg15N6lpFVPpQoGv8rhWa2qDMVw8bQZoPxJ1JUWNDveCiw47QTT1MpgH
 Xun0GfTMnqk4X+deC3gDhu/Y5UqZfDEugZKmlNNaL+5zCpmHYpt0V0twzEd6i/pzcem90fqhhJp
 aMTwzjvAraLMkCXl7RKgXsS8ftwt6L0cEHobNhvNnhRJ9uOFvPZAgzaKnNi25aOIdEU5V+begmY
 c3ZAohMrEyWn04YXUZw==
X-Proofpoint-ORIG-GUID: wA3HmiEig9oG9b5aKunSN0ge_4jyRjWl
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aebb43b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FDZwB5iHBSRriBojFeMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: wA3HmiEig9oG9b5aKunSN0ge_4jyRjWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040089

Hi Krzysztof,

Thank you for your comments.
I will upload a proper v2 patch with the lore links attached and
comments addressed.

Regards,
Anusha

On 11/3/2026 11:05 PM, Krzysztof Kozlowski wrote:
> On 03/11/2026 22:41, Anusha Arun Nandi wrote:
>> SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
>> devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
>> clocks, single "top" power-domain, vdda-phy/vdda-pll supplies).
>>
>> Describe all three with a single qcom,csi2-phy.yaml and a compatible
>> oneOf, rather than one standalone schema per SoC. QCS8300 is further
>> required to be paired with a qcom,sa8775p-csi2-phy fallback
>> compatible, the same way other Qualcomm bindings express full
>> hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
>> this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
>> match entry rather than carrying a duplicate one.
>>
>> qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
>> (3 clocks, 3 power-domains, different supply names, DPHY split-mode
>> support) and is left untouched.
>>
>> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> 
> How is it possible? There was no such patch, this is basically v1.
> 
> If this is v2, please provide changelog and lore links pointing to the
> review.
> 
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 
> Best regards,
> Krzysztof

