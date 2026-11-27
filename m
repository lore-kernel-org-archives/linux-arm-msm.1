Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787928;
	b=INIlmStBgQrqNCryA0LsB9OsVsbmEKrG5nyWkODxuf57UxLUYoOSwfPxaxCpmYNQVs/J
	 JV3/gf872pWJQCd6VV6IxdNCou3kiPI+7UAWMVsXLIepI/GtfeSZ4OAVX6RpCg75zylgN
	 3kz7iE3t5SxIYMPlAfhFtLkbi8G95F0lonE1ecncN+3RoZ8KbbTBAt+/Km3yrBdrp7Ps0
	 pPa9cxc9hdCfs5E8qurjEYwRPW97uq8jBDaBiyT/Xey2xX7/DFjqarll/UbhONuy9NupL
	 xufcTKjWqD3g6wkQnivrd/kteTX0yjwC/vAhDeFTgc7MIZ9IoSWouToNuJcFn46mFfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
	b=fvwrJqK5u/23aK1SJlKNtNG6gQw6igEEsFB1MmaTLRAYl+aX+UeCoOqd5rEeoKMCGdeD
	 AXPeMpT4H7Rrrt+TDLKpTzwcfAjnQZzzBIusdDnwFsAkR5xjxLzC0y0/+AtJOn8qLqCJX
	 WJREbrxWiWVkPueIqvSMG7MIknpLs9BxpBa1v+MU8zyEtzjOged/3AIeivrCSKEBwBYtK
	 0HP5y9ttviqMEOf8QAhdryGh1iRX+9CHY+W+MuN80kw97JjBNiGu2MboL2dBGdoDxzjQP
	 TxjDViD1TISyj0GYC1gjzw93Tof6kNyOQBlkaqyfPcBJznPqyjqscUjRKF/E/LimpFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FORsxwKQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF41606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF41606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOjcsKcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FORsxwKQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDuD6W674885
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=; b=TOjcsKcuDkQqhKEM
	pY+66B0jBD0y+w2WuxCnqNyxwYqmtuMoZrTl0cJPLd/mTTklLplbhyMHb4TC5Wtq
	Ji2Qk2dzyLEh2cMIRuDPdYHqZpE/N6fX61D4TPWfBAqekwTKIPscpXnW+mrJEX1g
	T67dFtRLf4IjNGcPXVhIvoHFM1MztDlxyVpCMHvcXvYw2hHwPLywFmqnznbL2nOM
	sz22SEUOUEnjiVdwNO2bgpnoMVFCLggMv5jNCcGehEEubP3PBl+8lUty7whgbc4y
	8od1uEnUK+wQdjbAqIyVdpYI0rzoM6UghTNlC4hv0RttWqdHeAoj6pqD+rHn22WG
	zHDzIQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49b9nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:58:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ee433ab272so327964e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787926; x=1796392726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=FORsxwKQO9IHATmRZuwnt/wzNKkR76nev4Im041FDN08XKsqjU4h+VVpkDoGm21N+f
         /oeDWC7HpwU5XAoQlfBoTZucLYqP2da14CrW2L7LXHltK8zA6hgd3FYjFMBJlh7gJTB+
         iD8G6N06MrZc/leeTgaSqm4ZRHGiVGyc5hvVqtkhQ6fAsP6PylP1sFZdxlR6y/biVyvP
         6suhILDhV7T7nlzNeWh9Z9G2sijUqJBTrC7KBxzn3QJYNhf6maSKO2w+9AfKYUiOWpje
         Gc72E6kLMJgBTCsCygQSVhizKDh/Je5Hnx9bL55FUerD2pHWiPV3arEFgvFuAb+dBxTF
         OYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787926; x=1796392726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1v7qWyLIaLArgF+vLRv6x7RBzzWwcYRuKaCCg84dQ9A=;
        b=GVgA7jkWQM22qw7KSlZtRGttFIkzMQaaSITJpfzv63CXLqsyYhJAkuT5JH56liF5Ok
         rbAbw9679cAgUmlu1no/YW7gyKRkp6RgYfFOeqODot3IoU0RSWL93xxAtnKBVeUgF/Os
         ChDSnPvgHXTMCGxHXotk1LYZVp3mIQ63M1vtGuzZ5YKYryTRipiInIJY/CPZPOsIazZT
         atHeo7E8dqEsmtEve5Ji17F1vFV0RJ/GTnF+0JxDfsyHp9pKe9SxhSMCyAswQ0Uv885a
         XLnA21YBJAWnojwzjVnelmVevl9XrSTXKGpM9XIj3+9e/45UgJuTVGmim1/N9ag+r6oT
         mxgA==
X-Gm-Message-State: APuU4Z+4hS8P/jTkIWH9DpyjUlOkLuoNtJVHkA5fbjs25QZTmIXhkWTo
	gfTBjW1OQ1JZdco6ZGcuE4nxzN6ZGc/PUAVbPTjgU5UecXZVHmUMBhD6MbHMYvv4ZiupaM+gxca
	Q6XsB83kslMR6mubvuxs4g1Fd/ynvGJoKXfPQZVIhFRSxp/k0RhytGyst9hizgGninqj6
X-Gm-Gg: AZFdTZee31N6NDYGirDWRhh/Gvv3M/UqEwyDc/Cl1XW6H/Yhhs1yfQC/q7f/TsXePSW
	6AfRKjLLhYdG79ShDDwDfCrGQp++b8qaRzd5Gr751Xr6Ml05d7KD2q8cz0pCBe9w2DgPYhz1P50
	6hyoiVeBDfprke/EwmfW7+Ou405IyP2ZCRsDfbFlOtzFoRmnEP4sfg+8Lm0s8iRPpCVxi7eNx3C
	BjNlZi2gkEjGljzNoSzSie06poeJ41N91sLe61SjEWrIpJ6XHT2rxNTggEcc8ykUXd6tllLJweu
	wMU4jAQuSdIo3rdbjZY+tOxd5Av6tCyisf5CxY0RBRvEv2X7w+aUxNqb7mAbLJ97RoQhLC2+iWP
	nxBWLHsHKiF4C7lREn4+SX288K1FGyS4EucoyrE+rnhP/eu8CxsvZVlWYtyu1CEA9qbqMTt0=
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434814e0c.1.1795787926245;
        Fri, 27 Nov 2026 05:58:46 -0800 (PST)
X-Received: by 2002:a05:6122:c2c2:10b0:5ec:b706:37e0 with SMTP id 71dfb90a1353d-5ee8ae3e277mr16434775e0c.1.1795787925770;
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm10578803a12.32.2026.11.27.05.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:58:45 -0800 (PST)
Message-ID: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:58:40 +0100
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
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
 <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ub6QZfujY0pF00m8-FdADd0LRe3fzjFS
X-Proofpoint-ORIG-GUID: ub6QZfujY0pF00m8-FdADd0LRe3fzjFS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfXx4E6ckBrm0Nl
 m38roAVA8iHIMnc8nlPNmDRRCQjMqYG3Ha4oCjy/cUe77PttHz3h1uDZi8FXiZteBblOuw0FkOe
 6YIQPTK/F5pp+TKszVtaGPUVEZJcUzM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfXzFdkxiBwoYpe
 tv+kKNTliff952Bbss7CTdKNaiSu0A1er8bhyzAyPNEwnTVcRuQEQzM41k9qo6A1oQCb7P5SzkU
 DvU1h1Gb23TmcYtKJXmvm09B7PPwLAPdnO584UJwUeeRHxEkooMjsL3YEBeFgbDS01THMrRbwR7
 v1cyVjl7SfWFKbcCQ6NCsyQEoIWeUwN1DfCVuvPN5rriLKuAZ4hO64zVUwICLhHGOjfla1DUuPD
 EKRdYLbprh/XggEqlhRCfB2TR0G0f1MwCyyOAAAB10qYx6lbnJZGqxa/wou01K7AV+xkzUwdWcF
 89i0BgptRcKYj1VRn1omOsmh9ifCkJOAtQ56cR0hZJqRHc/TNnfLEyf8ln29PA+BWrURKD+9nwO
 /oKp7fEYQ8YDL7soLjtM5aKzTG34O5G4dxacToD0PIKEGWsrkHoveILhTqGgYXeM7j025SzNOqy
 MJjjg/TIfx2UIQop33Q==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b098c97 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pIfNyjNAQl_vEFP8Sf4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055

On 11/25/26 4:43 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
