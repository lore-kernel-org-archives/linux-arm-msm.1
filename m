Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763614;
	b=qMp1cCyw6KvaOpz211U2JFu9WqYBazH5RUN7MhGPXnx1AyYxXXP7TlOb6Rx4XVLv56d+
	 cpaWC9yd2WHI+HXTWFx2fTE30TB2r1VGxLIU/aW5pAiidRhjkOfRCafqT6mHfJL33J43a
	 U/LrceU8Xv/kFA5YVfA1HFu9ulPP7sWmgltbiT9vhblxW0EAlqPCiahD2MmLlfeANZESN
	 f7ImjKY3Z5pz24xCtlRQYmSYZXqF4o1sGl2/qbO/ykNSUsV+UY2bRwmnyAQsHD+Ws8eie
	 V9c7he2Ybp3UZFIwHfJl6SLotUNh7v5PvY3GbIVly2ScjYGxDDUOJptPzQExrhcBTEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
	b=Oe9qhtLozIgLD+Gqljcj4fD55AR05s604L5fGINKG0t6SLpqLSToRRsznyN/LuX/m8L4
	 KSBGbcpx0FnxBsfXoDqNUOJ6bZcd0pFxPbAYrAZeTXGGNfAOskb0VVs8VbzC/n/QB5M/q
	 sYiwn4AvVGC5KJiMvcSeAqcgYv1Xs78nyNJSqy/B2Ho6NDlaUYSZ/e632wKSWEq9+aXP3
	 bl2UtB5oWiFq1Xoy9jJLa03SyuAzOWoEZDX5O0mbarQf1OpKQytfdFH8P1G+bOojb7n++
	 Wikn3+FWOFwmQHUYfoPFDL0b1DXG1cQh7Zfr5zfKIpU5kaOMvzABhLP3kW5iK24+wzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUygXPWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVJeocg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCAE606A331
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 03:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCAE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUygXPWh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVJeocg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RJrl193801
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 03:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YF52oMGRHzOis719Z3U08BM5
	RBvVjbos10Dfo+I2YNc=; b=KUygXPWhK6QnV5ZwcUPETjrzTSjHwxoMXP9Kdqte
	Mlmr0ySPdmLTdGPAoyqtwWSI7MwlU44AxV3oLIFMipUhxjJd8sKQ3SKyZYg8dZTR
	i4gTkVJs4zrEYEnXf1kKTrKXGDnaBV+0h7LeobW3KvTkoMNKi+oBzLcVpA+xcYAA
	gerZy/mtTYSr8tARK/0YlE1HzLe3aTmKG8Nqv+oABa/cGkh0ObAASpvkE2alADOU
	8gAG7W5zAQI+MjF9uYg5nrokWN7gS2ftNz/Dj4Bx2ciXtB3OK08/yqt6mtBXoveM
	E4CmpDBCfUjVd6QZHb0wu5j923k/HFPxYwcqNgD3kiuukg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nhsag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 03:40:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so320373eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 19:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793763612; x=1794368412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
        b=BwVJeocg9DruIQVdMVCbTmwp5OLxQ+0AHJsntu/B/0667AOd+A4MK5bK6KihagH7eL
         K5VHMPckfbNScyLKVHZLJdl4WyBGbxUS6/r6yXNzA7MUG7N7jrYRsm53DyO7zBORzfWA
         OHSqtpwtfJ4FE9NZbxAfEPKVVHfrULJLvoKjqvvksY6blBofKA4U1Y+49S7d5VfAq4M6
         vNRP04tKFf4IYSwPSk9+mtNabhV/AO7Nv3vtdw2V6MClvOIpA6/KMFFSpbpFp+9LHO2n
         cXCv4boNL2xSj9nJmnI6scmWCuQKBIgb+rRgmiPmWPU6PNTg6ZuuEiDPz6zAW7hhjtDh
         6y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763612; x=1794368412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YF52oMGRHzOis719Z3U08BM5RBvVjbos10Dfo+I2YNc=;
        b=n5pbYDcQHTUloPCLDcUfHhkfDrJWfRyuWaa2YVEuyNfQBOdEVwahdt2yHGzmjccvfK
         EkxNo1MqyojzGCmv5d2wgfv54ukJn++jkcXs+a+9YmYguqlIhG0xEcI3+16PHlUx/G/i
         LEbi2qX6g69lhf64PNbwTN8hd3U22GrSPrI71SqCADlGHti30O4LZYDIL5MIukWQZTia
         yaYJy10aO0GDS2GwFaqUa52eQE+AIcTH4IGF4ktEx9UGHSFkbgCeEsV1YeZy1mw6bx/G
         dLmyC98PTk/ZuwudZQnNMQtyjkqPVm9LRLWHlo/oGcbd1rxH6+l7gdOuXhq2fewQoGOK
         tWKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+kCT27U3XqswUTLoeFRdpcZHjlQu6hqIhPtuieC6wqXu0/EtD22JfWdCbzOI18gU0gjz6mldYytNMlPBR@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tio4HgILsgO7CahfjN7Q0qTB7zYcXkQJ5cOJDY2AqRBeYDTTB
	ojnM1WrK4JmJzkCpZSAxcnh4frskQIWMpy07yMcD3kEfWwHKWhHc09wqv/MrLfgBv8p8emRJ/Zc
	3oTv5KPY6IU5idf1F9O0XX5EM0XKWs1YrIBTNJBbled+i00Kni3tu8qmrxbYqiGx8Paa8
X-Gm-Gg: AYBFou2xWVoL3oSk6Ww4b0HtiBtH/gdsMjll8ds9aP4OIqb4R6eaizDkfeAtDT4y31c
	Ke0ymVY1UvYyFSJcO7y29ruN5Hd2EK28gbW2QU4mUKpz9dnrw7UU/Kp10d1U7KdgdB/jzgZcJd2
	jhGvxmuSEdnzo7ozfQAabuUlCi4lLsJde8lC6GtZiHPnctqcFfb5D+IpmdnPUAJXiNR7rHWoP4W
	FnsmHA1G5htla1sVgNwQQtHzMYEdruOJH2sGEzsWEAhB/PQNivxs1RfCDvRrrDbaRnNl41/a6tL
	iBnXjj+Ix0m8EkW3rAzDYzeqIvfsIe6IA+4hENx7SN8c6AA+6EA4m1stSN/MPkvWUfK4JbRGW3s
	bsh1sSs3PRREB4qEvEIKlbb0yTC1dAyxRjiAKJ7e6lEDgKiCTLh4MGdwP5SCVx/0GEXBLvyeo+r
	IlxTRBcP3CEvsAbQ==
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr22041219eec.6.1793763612417;
        Tue, 03 Nov 2026 19:40:12 -0800 (PST)
X-Received: by 2002:a05:693c:638e:20b0:369:ef63:ea95 with SMTP id 5a478bee46e88-36a423624c8mr22041190eec.6.1793763611882;
        Tue, 03 Nov 2026 19:40:11 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a5621sm3160585eec.6.2026.11.03.19.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:11 -0800 (PST)
Date: Wed, 4 Nov 2026 11:40:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM
 formats
Message-ID: <auqpFdkMkevMrAcy@QCOM-aGQu4IUr3Y>
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
 <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxNCBTYWx0ZWRfXwdQgCV91kLVa
 Llvt7wejRbjTLKzW2ZGYyR6ZerMEV+dSRAMdvtgqqCaKGnJGCW1QAasdiynUwtnKHfC5wBUJmZw
 grr8laZ9FScfyQlSkgLaTZVcIPyQ5ZhRcoaGIbeo3W5++5xlESyNO5NpRBKYJURGXWYX7yEHuq/
 hGkjx49N0anyumna0ZdhNfWh8KQ5Kk6xxvP6B7WhauOObsp9JX7eV43JsKvTMlf8PYZ/v/5AhRj
 T10CdTxSq/mb6GjLtj1Yc+MxSGKMFUTnbGa1jcf1Ov5Dx22gRBrALyuLJVWWV4mzcKoTKzjST7A
 /THmgcIxedGlNCy0dPdu0QxBL21v7drA+P5d47n3kjFS9/tU5ePUve6V0w/FI3OGaKMB9WFPfNT
 2eOKq4hloKQq3naYaHQW71I7Hsm4lP4pH8pDbi5xCBFVCb1gkpc5+8S6yyrzxLDg8IKuDM1O8+g
 ya03xuoisTORPGHN5SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxNCBTYWx0ZWRfX0SS5kRaEiqZB
 t/Zw04ot2wY3DAhJDMAu4lZkqB0Zh4v/SH/D6qwvOyY/MRMT2AvcVwqxzPplZDgk6WZSMgBAaNb
 UqD0r39T2Bz8ZknOg5NTnDs85cbz55s=
X-Proofpoint-GUID: ukRpbM2VeJdjd-oiY0OKhMk_645L415o
X-Proofpoint-ORIG-GUID: ukRpbM2VeJdjd-oiY0OKhMk_645L415o
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeaa91d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yYJQ81hfqoN3XqicPgYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040014

On Wed, Oct 28, 2026 at 10:47:20AM +0800, Zhangfei Gao wrote:
> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
> 
> This prevents TDM links that expose more channels, such as the 6-channel
> playback path used on SA8797P Ride, from being configured.
> 
> Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> the common PCM channel limit definition.
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

On Nord Ride board:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
