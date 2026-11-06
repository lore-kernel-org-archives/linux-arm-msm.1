Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972439;
	b=VrHR+3bnZWnZj8FK07KR8udEA5SvhfT05MjqmtO8auv1eU8iroteWhoseVt7K0zrElJa
	 FIcrezMD2zSls3zsma8CfYQpl7Poh4BHau420KPMuD44YMvajKjeCv7tP018cTbjpaBa1
	 irmHtWd0doVJbAKPnZuE/CkEfjjgmx1MJ6tLW2LLRlKCma2Hdees7is/plarNfvNeqZWt
	 SAyhRoFEgFq2hzYheRWBVq2ZphO+hJyFzIlkdzrKtNKpFhgmXYOPZr8EI4iqubE0jIsP5
	 AlPzhdEuKhJz0T+XiGbDe93zQyGs3F1725LVlGgtQ7T83R/1mzMnr7B6kd492ngSipQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GDCcjK22s0dpHL/t9oPLo+bDI5LKQyG+roTno8WQGAY=;
	b=yJ3NhkjZdD9Zrh86QVftN9Od8YQN/zu1zzpkhEzIOFuH9ZE+0DT2lSJi2h1Pb6r4pnal
	 iVaw9nF8YhYIuRvWQh6AH6A/WTp3CvcCSjrgSnI330isw67lbbascI+6RTwSjIlwrsSkU
	 5Ozb7bMfxHgzhPhzL8epGLZcZZoYu1xXDNR7HHSP0oMHtk6b/NdREblJXSFlQrhqoTgsl
	 8GCIgWscMsXLSTEF816HoSOTA3pkiYHIJTHntCClBp9aZa1IKxb6GBnEIxJouIhneI7VF
	 /qu8WjewJyqTb0ePXmouU1l25WplMF6DvAbrO77OrtzGRYlIgHJCxDsAw/0WKiR4EQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mt21uQwH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PwIpTiIW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55200606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55200606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mt21uQwH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PwIpTiIW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APBqq444198
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDCcjK22s0dpHL/t9oPLo+bDI5LKQyG+roTno8WQGAY=; b=mt21uQwH60jZV5YW
	bmP8efFpPjP5ibdMaideJXA1mUJKEe2ENerXsynsr0DD+DuxPZeEvQ7ENDmjz9wD
	dVk+4Lcw6/2YyzReaW+ztxb+6XVhqvQgwyx/DkdCWobxvYkwgZy/nw1wnPZH2tDm
	kISJQSojSv+jL9sQP9oTMVlv757YeREFCcCJ/2R3gcWNeiD2Lgd9f0g0nIE6azfe
	D9fzMwya7PVB4RgOiXaJ5419mGvRKlQKdFy4efXoqwZaw1PuPfFxuln7olNuGMW9
	xuPl4KrTSugyBOPvK7GBE2GFbJKGUgV9Ot4L90AGBGLtpjIXKZ7LZno4xJu7chzG
	Onc5sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u14n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:40:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso10599185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972436; x=1794577236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDCcjK22s0dpHL/t9oPLo+bDI5LKQyG+roTno8WQGAY=;
        b=PwIpTiIWw8FIUerBBkwWbF6MBvu8kbY7uFo22a1BtDQ6A2dVoNuQNxUbMrHLVQTayv
         Imcu1jkUFlsGD6gZFl3eZHEtRd4xwYRxRleGCIKoe89HJR5aqY8qOTsbSEgUTCatzKPR
         ozV94ZZNc26HS7SsJWvhvpKS/ZhqsCIXPlpDSxHjTV5lSPBbFufsKiMBwh6YHwF4eUT5
         sXnmUdAyFkXeAZ73o3TbkHjfMzqzQy7TX59tTK46dYAqH3vl9Sp7Ovsi2xJXy07Jy2IZ
         p7smqCvIzOOQgfSlgHF584hXQ5MpfS8Aaa/+Pm/Z1wXSIKWBeupjVGcpXqrgQFcNnEBi
         18lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972436; x=1794577236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDCcjK22s0dpHL/t9oPLo+bDI5LKQyG+roTno8WQGAY=;
        b=0gWC8CnLs0h5pkjpmYo9LsceO9Po9TytHcO5P+qmCADvTcc9SI+rpcODYRt+gA+Ceh
         ECOse5g6q6p27qHOqZpNPT4T8BkK7xWET9EpU3lUaJ8If47Sdos3HgL2s+LiwD9HCbQX
         ZQLtmKXwUqzvIousXwOOfL9Xg9kmkpG3JMKWVMrtc5jQnfz6VGI2x3RHMyp+J0imjOGh
         rBeNLPkmxOpBw+hP3ievn1iHL9s4PlSpuiN4eson3Pdng5kF0r6rmBlXKrYIBzuWnszO
         6AmbJ6kUq1bqpRpOsWH1GewaCjnDvn8SgT/qNpP8WVuxm2yZkCJYmtc67YKIC36MZxqd
         rtfQ==
X-Gm-Message-State: APuU4Z9KysXHaa3A1lCZKmDXPjShCCOPquNWahl9OBoHCqT6EQTHpcpW
	fFutjpoyk/nPl4V6IBHNiFLQuH66CtRY4s/KkN5NhEBmWrp/8cMa9YmSc8NuPPGOnyHc6QKg4c/
	jN9tEyQhxmSe4DHBdvZwFyxWbJlQ0Wfak4VKTjoJfhTjps1c0F5Tnnpd9abWtafQP4cJ0
X-Gm-Gg: AYBFou0zrmbywipYnBnIV19mkxjmk5Q1IgZ6q05bN4GsOZCnS98O+Rrv0E9eWQHWbCF
	XE5/cfODztx6aOR64p2JzEJnbdBuFJhin3kBgeiUWP80lO+MfZz4hX9oIjakXJoUR1ibQJ2E8F7
	yLk1pM2JfyM9q8AI/efOGaTfzufRTindCDx722JsrhCsk+Myh2ws8o5HX6p5fsuqISe5Vz3kEaK
	D9VRFy7Y71gSO+LZT+VxrE+fjYFv5FkYos9SaRiBfbN3o+F2AS+G+HhaSHs7cUEtvXSn+xOjLZ1
	TKS9Vz4FvZ+zUqov7sWxus0kFIo87Zry4+98qPM7ADHl4qF6fXM0hPa5695JE/ckTi6kZ7ck3PM
	gVqY573U1ymhdoNThMcGfl2UBBLsjms8jfIYIJ4rqOOkwUbGpVXyKr+jKq2NJ741vBuNExw==
X-Received: by 2002:a05:620a:2055:b0:92e:6485:f640 with SMTP id af79cd13be357-945f357ff62mr327791185a.4.1793972436422;
        Fri, 06 Nov 2026 05:40:36 -0800 (PST)
X-Received: by 2002:a05:620a:2055:b0:92e:6485:f640 with SMTP id af79cd13be357-945f357ff62mr327788885a.4.1793972435896;
        Fri, 06 Nov 2026 05:40:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35673731sm79647366b.44.2026.11.06.05.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 05:40:35 -0800 (PST)
Message-ID: <1e3638fd-ed06-457f-bc8d-1f541caf4c50@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 14:40:33 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: fix a use-after-free bug in system
 shutdown path
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX1EYX48fvCE4H
 094bKy0yNR41eIAaM41eDrgJdi1+FmALexltbXHTV4dNF7EMsnupmHH3kH+lMdvWsfDkbGlWSf+
 JDDHseBydRRfAgxz/fHs/YlMKY7SZ8I=
X-Proofpoint-GUID: gYj6LsqYxV34zujsY71w-CqLXzZgnqhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfXy+O2JcYTMTyN
 1Zl5Enda9GikladlaPSEbQkAAZuHyfJREFgaihZ/VPwTlGQQ88hxy5qQCYnspJ0V1HXDBh0BEQm
 VS4a1eiiZEwTmcoloCwYoufohRLbfFznvgRkmfCEOi4Kv7+f8/AGIPk6BVbLFlT3szSXsOtplDj
 DI7GV/lN9EMAdis2qwiaKLsYsU6KHPUc/SVb1khL7+jEMTQ23mmds+mSNoXx8AOPnsVEuqwq6RR
 gOH6z1uU1CyRUSaZt3Ik71PZqQX6jjBrqdEgLm/wZgcU8U61anuCbic4Tg4cT/PMhBHGk/DoF4+
 b58WfqGXdw7TtAtv2zonff/8eF0ldZ5DUmIZXXpIYBK4tCBcJc+TFgbWiSEDqsW+pyL0MuYw21d
 fUqdqAp9GfpsfVMARgjeOeps0/IhBFntPdyKyBNA2R3RqjZFaT/wvlVZWDnFmMtDZ2VhE36hN3y
 tDhWgd3MsYZmJmKRvHw==
X-Proofpoint-ORIG-GUID: gYj6LsqYxV34zujsY71w-CqLXzZgnqhN
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedd8d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a_ps4GQ-2PcO9Fe_iXEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

On 11/5/26 5:09 PM, Bartosz Golaszewski wrote:
> msm_pinctrl_probe() allocates the pctrl structure via devm_kzalloc() and
> unconditionally populates the global variables poweroff_pctrl and
> pm_power_off.
> 
> If msm_pinctrl_probe() subsequently fails, devres resources - including
> the memory allocated for pctrl - are automatically freed. However, the
> global pointers are never cleared, resulting in a use-after-free during
> kernel_power_off().
> 
> Schedule a devres action clearing the global pointers that runs before
> the pctrl memory is freed.
> 
> Cc: stable@vger.kernel.org
> Closes: https://sashiko.dev/#/bug/linux-0c3a18a4-3de8-489b-abc9-e9e3a8641ed2
> Fixes: ad64498762dd ("pinctrl: qcom: Hook pm_power_down for shutdown support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
