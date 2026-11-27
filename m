Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785513;
	b=i0B+zFBCrQT91m1Q2OKHGq/3/8Vav0KNwk36hMS2WFTxbwpTYpjMUizCRZDGtX9IGyB+
	 /lhBewIJGeSHdDGIBV7m9XWz1WWztSsFbULoP3cpY5auzczzbr49s+HF/oHLyyGMv6Fjb
	 EH1xIX9JclvQVKOsydth649PNsmriU/TP4MGvFIhRGjz4S6H/gzBSNDey2NCzFoxhvb9f
	 dbKFHhvMMefmzAL36TYGJJMzQDIOvMNXsqeqgQW+UrneFawU0Uyh34Lljt0MFVEp7UliD
	 /xdKePrxzeupqZj61es8dihJNwgketlSG3Fa7Iipp91Q3gpbz5Bg96GfZzU0R5Q2hNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
	b=l/olqTlS63yZ3krXUi4hi36FqepTWEd/iDRS7ALNWPsigcxQwL9bUCnLKzuoAKF5aWD8
	 4zyXWdFrwW04bzTcgLNbzN/HCyM4aqlVlwbxcGU37t2vaoo2d3LLDNa3gjJq2nJbfAqHi
	 5R1+20jFZemSfhI0se4xk6xf+ycJhOYfZB0gzWxdEwQB+PMavKwp0h3Qeg3mkXBRfMAOQ
	 zE7hdiKDtedzQkwCbbZtv6EIWTXbBdvy70a7V+EJOCfAhhXEBEbTY6/SEVPUdeQpiX3EW
	 o72yOU/ar3vUXB8HqwS0Wa2zd0ItOKMIhfwhMbaFL4uHZ0HMYNb4IpEB9/PPgeykk+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p80WorYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZEDsgZR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1FC606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p80WorYI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZEDsgZR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCheUm2205568
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=; b=p80WorYIro4ohzW2
	n7G2va8lfGKKOkZeK/aPziA/M/Oyv+ed4E7+40KYRy+BHTfPlETqTg0EVi4MklbE
	96bVLwkXnD1G7qHYs5TtpW9m7BFckXMwOyjpVuBOoKWv7bRhgw2XP2KlE52/HsUp
	ZwTtRzqDRN0KfHefjrP2LHl5nzag11ejIOGmPxFrwV9KznijZRw1L6COLByObHyo
	FWeefEiy8r1JqDhEAeUHz4i8R/OuzVhtlcHIykNHOSL2xgJ2v4Z2b3Eop0SVtEeu
	dZlXZbKN5G2GyrVyRNqKVXckT5K+ZQkO4KeFHfhkRBsYxVm1t8JIbVL6iHh6H7SM
	cyAnMw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hu5xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:18:32 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ffe90b2cfdso2829000a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785511; x=1796390311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
        b=WZEDsgZRFJkMaMpvF0QTewBtzt3pcETbMpw179xSUzM9xw95bf7e2BxbASAlz09kUd
         xKHI04E9i5nXGOAt6r1z0fkusPZHHhvMzBRqsiOfogmt0lxOdnV5WhBMMJSI6Z/57qMB
         0SVfznkiIxzjf97Z2zFZG707cr07ftqESul3ZA6rlTjejPJhAT2c5RgKAq722VPRyF6M
         9VHJnsMYf2CN73jTMqI/j6a8e9fiNiDmHZdAoVK1BtGM3ohH02IdDMJoaJAJEG4c9huv
         Xh7eHTiAKI3R0YlANv/R1BnzLkoj9HM2B4DDKhurpkke9DQ2m83o35fmWQBAxPvzIsNI
         UwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785511; x=1796390311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
        b=YQNmf5m8pquFoiXStvvJhI3HMllSfMYnucaVe6a90N4nlLoHGSpB8kydGID8BtvhHz
         Fp0U1R55sE9ju+i7JEzE27tAYy6VtZVG7lOcd7hbCgBsXhIz12VFSr4R/xWH/aB5au2H
         73mbnkyJo0Uh1aDTbJl0s8WA/cDLHARAbUwicthS1TufWnwAthQXZv3rmhxSlWpuBKTy
         rRSphVn8BZFuny8FbCilTkmQThlACAPuaRO75LG89+tkCOz8fFSVIgPzUKCtaOdwX3hc
         BPXypbimdCe8njcTUdVxYTrSKEBwQOL47pNpQJAi0A4cuClcKllDDxZZEc0sgF0crop4
         p4Vw==
X-Forwarded-Encrypted: i=1; AL+hErFrrK21khn+YDfBmvT7buZiMhLE+q+F48L/RIhjxRSXL0p7cvD7pjxT2xlRASk+TKVwrpZQkfuO0lpuUqBI@vger.kernel.org
X-Gm-Message-State: APuU4Z8QwW0tKMo0yVZU2rWfXsMm6HWZthf/tcfDipR91tmwgjBET2Lj
	9fNfd6blHn9juTPqUR0oIcXk3V9KsWVW01Ig9xba5Eerrhcoqlf76mGBdMeuwkoyHjSO7gRUUZ+
	/D2S5PhQ4q+lPiHyhafF/eiAipCRJla2WyNx19SGzzQY74b5EtCyBMxPAMFaP4YUKv23e
X-Gm-Gg: AZFdTZczbME5CfWshu6zp5kuc3CZ15rFWXKuEe/GSQCJV7UKYo9Lxm5lk8Y4F4+zDke
	rUoEks+Ex93HIlaqu4KeT2prAbbRCbUj9QoKZMLe5aXit5BXH/Skzf9XPZrspVC2PTbJcQzjwDn
	iJskQyXeXCDzYnkGbYS93Nquih/2Zr7xZNyr8Va4g+gqcGEw1+rHDDcQimcF+D6QexPlICWhSA6
	R/LXp+Qd74M8OegG5E81lWZDkZ+EgjGj9XUUjOcSIppFQ2gSLEVBIvt1f+bhuGyu4oVfJTCgIEU
	/d2svgU8RNUbxl0sc1GK3eED0vOsx/GVVC6QjQrKKd8rchOQCdJ5s3Pn4xIQLkbNUGUBvs/Uwn5
	mntOhSMpS/YDQ17ZTcc+dURVdkH3ORXB0us9YgdjWzMzvgWMVDSIiWp3XEgxTFi8bWrmowiw=
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23721620eaf.0.1795785511343;
        Fri, 27 Nov 2026 05:18:31 -0800 (PST)
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23721577eaf.0.1795785510904;
        Fri, 27 Nov 2026 05:18:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm11167573a12.5.2026.11.27.05.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:18:29 -0800 (PST)
Message-ID: <26b2413c-c705-4ed0-be25-ce5ee265e395@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:18:27 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Rohith Chiluka <rohith.chiluka@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
 <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
 <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MiBTYWx0ZWRfX5oCUvTXU6k+B
 n2SQjq4y3D27hiAGVOnhJIyEZjoCk7OsQ8BDXuLJ3I3GjKZhZWamKjjUElOhZ0/mMbmBWNlimOz
 xOKFKm2/iDSMMFrseCwljqojEr040qQ=
X-Proofpoint-GUID: -Ja33ujwLlPunlQOmYNmz1aOTBWV2527
X-Proofpoint-ORIG-GUID: -Ja33ujwLlPunlQOmYNmz1aOTBWV2527
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b098328 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T6v-2sJnNWr9hvUYHbYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MiBTYWx0ZWRfXy5aTitAU80d1
 dkOD+7Lzc8QNr8jP29vHHhRhwwFSaz/TlpHp+G/0NCOQtgwlJeoMabSuwHAEVFkZzhyPPfZCqRR
 vqJ03D4p/J+A5G69YpO8vLh4+CM1YNkkZF/g3nzwSDKOd3IogCdflfINsE2TTIRBhlPJr7qOkzp
 3aJKjk/uluu6n2bYfl5rQMSULdjjy6NQAy6zxehfmWgkNfuJQ3jfK9tmhBPF3QD28SPXnPMYN9l
 Ct/Vh8rm6r9QlFh+hRCtBp/tmRY+AmKOSnNh/qhpZREuRDcdzVgeO8izvoZaUzet+3nz78QmlWF
 HXymVczxqt+QY7dvNuwWVpRJYbQtS8D4tKRpY6atEqRbcoaYKc7lqx7/yzxYXHDBzCWeA236ce8
 DMFa4B9F7e2Vn5MW1Zxs9M6E52uo2E6w3H9RyANFifjPoGDTjjDFk6mkm5Kau3WTDMXURjMYyFy
 +GPXavZ/Q/jNaJ209Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270052

On 11/16/26 2:24 PM, Rohith Chiluka wrote:
> 
> On 11/5/2026 5:37 PM, Konrad Dybcio wrote:
>>> Add a DAI link for the DisplayPort RX path so that audio can be
>>> routed over DisplayPort on glymur-crd. The link wires up the
>>> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
>>> controller, with q6apm providing the platform (DMA) component.
>> Why do you think we should only have audio on dp1?
> 
> This patch series targets |mdss_dp1| exclusively, so |DISPLAY_PORT_RX_1| is used here. Support for |mdss_dp0| (and consequently |DISPLAY_PORT_RX_0|) is planned as a separate patch series to keep the changes scoped and easier to review.

Every patch has a fixed cost on all sides - for the submitter, the
reviewer and the maintainer (as well as everyone touching the git
tree afterwards.

The submitter has to do the work of committing, writing a thoughtful
commit message, ensuring everything is in place and then finally
submitting.

Then, the submitter sends an email which reaches dozens of
people, actual humans, both as direct recipients and through
mailing lists. It also happens to cost machine time (which burns
coal, gas etc.).

Then, the reviewers have to receive and read the email, analyze
it, check if it's right and leave a note.

Then, the maintainers have to pick up every patch, validate it,
build-test it, perhaps run through CI separately, sign off on it,
push it out and describe in the changelog.

Then, again machines have to separately process that on every
step and on every single further git operation which now has
more history objects to dig through, wasting disk space and power.

By manufacturing work like this you waste all of these resources
(and on top of that, each one of them has a clear monetary cost -
be it utility bills or workhours) and you have absolutely no
excuse to do so.


In meantime, Srinivas submitted a series in parallel doing this
work for multiple Glymur laptops at once:

https://lore.kernel.org/linux-arm-msm/20261126183806.172485-5-srinivas.kandagatla@oss.qualcomm.com/

I assume he didn't mean to one-up you and we normally take the
patch from the first submitter, however that series takes on a
larger piece of work and we'll be moving forward with that one
to avoid cross-dependencies.

Konrad
