Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C7230264
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771315; cv=none; b=TNTu8gwLzvNW5OEBs/746ZELQ9aiHaU+XLqocSp/W1yLnlb1txmOJ62uF/banqjeZX/QvzWxcMR3EZxpRwECyHNIGw6qANIlPEEMLldDBo7l8h+nnHNnHRSX6PRfsacjC/Hkn7/GhW+nvHNWA8ZB0O/Lvm7nLJnEUc0iejiMLHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771315; c=relaxed/simple;
	bh=T5URmT5QPTsKHgEHA05PozZ/SXOAu/fwq+audSuKHJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvVqDRPuH8deFBYQ7C4U6bzzlMQOpd0UsY9HDmYkXYJSkYcHl48+R8fPevWK8hJ1d/wO5vT8MAzmFvvdsM+Bd34Si/vk0TF6D+kzdzBS9W3m96s2Ilf81+iPNkysMG+FeIN2js9D3ZBpn2TgiP7nkOntvNLtlJy2piwyxAq0Vs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA3Vq7jP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1XBe/B0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA3Vq7jP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1XBe/B0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777elf3903337
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=; b=IA3Vq7jP7e+LAfsO
	jTObwTxWuKyOsnWCX/DIg5K/uXGsseZWYNX0g+9dbx/97FffQMgVuwKH+Po3ksRk
	NlNvYYz06Reruruukoo66nPnW8S3OndqGE3+vDRGJcJtxmcI1BShFZJG6HqNw3UG
	XEfIWedLdqmjoyRaKjDsWr6x4RDi34kyRJhEqeTjbedC7IM/fK3cgerR7vHqIkAb
	wnqWxjRAIDb54ADLjVafc0OS47U3ErJkK8XXViKWwAc1xNzqUXn1uA4fBSVxA9ZT
	Pi+yGDpuCFARz4koQhm8RBZKKiz/yC8IckAmS09GChXsuHa9P13JwWdktq1Wl+Pw
	zvkiyw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany60uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:55:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53038881f1dso4971521cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771312; x=1789376112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=;
        b=V1XBe/B0+0DdM935H9F+bPyDKaw7iPBVRXoRsVYcjV/+WoMjSbbMQ8eE8sZPjEYZvt
         bLhO+BSsD+YsTwO55sOA1EAtUJDfrHdHkKfLOYID1jeIAv77hCiAFXDTEmPsnQCU8F7F
         r5M4ijwNyUHKRqyDG4JxG8tSjQnvr4rP63LkZgiijotEFGJYcjZoEGWq/0+v7m1hat5m
         Nxin1fwe+e5BxxStDw8W6pomGNfU5Qie6euDiBq+3F0VmksGzsqZb37J/ID9vgNvdm03
         FTqj10zTHdg1q7bzrcoWNGJDlKBmEkUT9GdJnkqNtzjp9NH+hCFu6y/ybTdhQdQ3cZqa
         0sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771312; x=1789376112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQaqWkOzHK1y/jY2QvLFmUUxM5MtiKlDNy1JW6tYA2M=;
        b=mt98zuapQzBwHPyZXp7Elx72brs3w/vhc+ePxHr5Qy0dw1cqFr5txFUVdBFtBl8bMn
         beNbT4+d6/bON+BLm1NtGL4XKCrCqdbpKzx9I/AGSe1DUyuVKoKL8CQ3TpqYVaBa7/rZ
         dIedbReNfjF0h3o4jOnEy0ICza+pEz0hO19AXrsq5kkc76U1CPBMt3sbFyNHe0wHT8ZF
         AQqHJ8BQLRN0K0uA0gRPLug1/h2OQVkTUXoxH+zW/fkPx/VoB0kzED8eW/HrZHiEHBLN
         1yfdLcn3eIIciHH5eqqwH/lvK+SxtGZt7utQJgmMYdF6+/z357CVQ/jxNdK0lmkX+Y5j
         q7Ag==
X-Gm-Message-State: AFuF++n/lm4WWSQssEVBGxaSZY+YtwJ3snk/hCnvvz1gn4rqNUtqtY5F
	TLFFPXZWcINtjdd8fjurR7nSXt5adZz9B7p9maEv4+IuYxJEeAwNjxnu+twfj8raLBi3CdtBaeM
	SH3ZGm0s50HiF/nW6IRWcJRhwwMpjS+wXYOaTlB53Fvow/Pfb9YmZ1oOVI2ptlvIxxpvV
X-Gm-Gg: AYBFou2AmJUwpj447L517v2V1yYPo3CdfgbbA4Q6ns7d008mpX8kCuPXBsir8sQUEek
	mBot0w+bSKGl8JELdg/W/zgR/gPGtB7/bbHlxuAz+vd22JhRTo3pTpUByog8Jv5gFw/ChDVqL4I
	hAZWE69iYkuehHvy76uHHrQSubLYzoDCz5bB8Kcp3QB+N3i6jKVfdaM4ekvH5k2LN0aIlAEyQiK
	ogHQyVt4Kh9VCxXzIysgmBQjZsurnu7I+cfRk8YJu0TU/bnmWk4Q4Y8Jfmj+3hPgYguyzkYjCrO
	QvIUNjyUM4LyCIPAA5+kssDvr78XaL97e9adSNV0jeTTMBMs55ja55RQvyF9nTIRQLU1+AvMgua
	tjko+LzoRXM3iv5Tt9HPz2A==
X-Received: by 2002:ac8:7c46:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-530646007demr130253281cf.1.1788771311663;
        Mon, 07 Sep 2026 01:55:11 -0700 (PDT)
X-Received: by 2002:ac8:7c46:0:b0:52e:467e:ea8a with SMTP id d75a77b69052e-530646007demr130252791cf.1.1788771311100;
        Mon, 07 Sep 2026 01:55:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bee8e8sm4381581a12.23.2026.09.07.01.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:55:10 -0700 (PDT)
Message-ID: <6f14d260-b8c2-438f-957c-8a169e19bce7@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:55:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: ideacentre-mini: Fix the second M.2
 3V3 rail
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e7bf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gxl3bz0cAAAA:8 a=SWV_-4jX4OqQSRabqnkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 3Ii3UGH1ubQzFGK_OAJkTz65I4gALMUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX9mmN0uz0Q2Wp
 cTc7a5fQuq0g0lPCCswU6yV/+m8qIw5TSH1slGdjQovwnIZyzpCzwRgc+V0uPkIq4aPZDi0MBJK
 MvNgnMoEV+x8ANhC1DVC1h7w9BJAdlGtftBh4bH7YlfLAHE3oCK2Qf6Fk7MvNmc/U1nBAmv/0rp
 c/WWTbtYh9Cr6IKFAc87GVxBdfsdiRKf6MFLHP6rIcdww3NrgD/4fUzCiBL9kePXnfLtYC+KnPz
 /G9cvrkN73OkVO7Wb6ps+NCSfCRg/LYCOtnm5Mv3wDEGcCRKDayZfs8/clAQNFoGtu89/nPmETJ
 X/KbS5IC/nJ3I//ADYCgCvW3oYuFaQuX6bLOjRtAd1sOGqd1Rfm8h1RNt3XyKqzMt1StQrxQ4Fv
 UhwYcqktFTA0ag4UTwcHskr4Izt4i0VxioP3E2MYTu50j9hsC1nnkLeDhqNrWQ6kbrmc5oUTuST
 IYZasQ+W+5Gd+RaPVmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX6XcHJgc7Ne/t
 IqDzqDDhIQqtii5MwDp3c3lnZAd//AwE71UTANVs4cCWSbkgW1oTGPmZa/aA493ubXnVa6SbemO
 LEA+jyXuQut/vQqE9ezTaRw5IEoJIuI=
X-Proofpoint-GUID: 3Ii3UGH1ubQzFGK_OAJkTz65I4gALMUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070096

On 9/5/26 11:29 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> TLMM18 only enables M.2-1 on pcie6a. The second slot (pcie3) is gated
> by PMC8380_3 GPIO5; both regulators previously pointed at the same
> TLMM pin, so the DT had no effect on that rail.
> 
> Switch vreg_nvme2_3p3 to the PMIC GPIO, add its pinctrl state, and
> keep a 2 s startup delay plus always-on.Without the delay the pcie3
> slot fails to probe;

This is really strange..

> always-on is a stand-in until an M.2 power
> sequencer exists. Both slots work on Purwa with NVMe SSDs.

I suppose we have the "pcie-m2-m-connector" compatible, but it's
not bound by default

> 
> Tested-on: IdeaCentre Mini 01Q8X10, Purwa (X1-26-100)

This is not a standard tag, which checkpatch should warn about

Konrad
