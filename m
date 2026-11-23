Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447940;
	b=vV6l2yjrW7Y2Z4nAtMSAjivkzWw8McBgpglcGN/MQdqEULwZBSsFrFL1UOBoGyl+cQAw
	 P5uHTEM7ja7UXN6Vz9M7cPG3ZtMAT0tXXVhO0gNiljxyXo3sE6viw0wXdyOMpLpp2/hlG
	 QMXHKWjl7jxdDBI4WpjtRUdkY9Is937WfiiLjSO+XrUt1okFQDoqS/NhrD7/6LYwKMXZe
	 wR623aZuUDg1XusK1pzifBMllh60Y+AkXUGNsUQmiwPk5tQJ+DQSb0pKIupWII54zN1zh
	 OTtpDZcfH8KMao6IJ5fnqWzn8xn4SdBcwIU4uU7Ycoib/t+zTDj8Vk2PoSNtRPx7qTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
	b=yKL0FuhHsdKopS4a6pg9P9xbJvi71zrTxgToZ7ygsAIe1Gp252fs5uS+1Zxd4Rh6BtAU
	 zBIvcJbktzpbSkMqZ38paORsOQxTx+Mi0B0pCjhvt4BZjeGpK+WyJ1F2jFJkV6OOeeBrj
	 nKZRAVlz+CM8mD5MWvHEU4EgopDxXjxgNUyIWu9uRQBv6m6DuZTNwp9TV3gLFWkpRk37/
	 /u+F2HaHEffyxz5EEYOUf85aMu7HRUX+nEr6MNpprOtn1d4ksdfRWHk8L3p+RHJTJ4p9U
	 jowybWBFyJexgqdnirxHtzzMaWqGVMcAEfgiIM8oS7fTDW2AaGwxbszfE9FMFqlpQFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTYpjMD2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3C606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B3C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTYpjMD2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKtbh3329278
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=; b=XNi3fIG8bLeWMU+f
	PwdUtzFy62pJN3m/uGsa6NfdR7ouMm5LiYtfaTNBKNdEfLs2s6R1cStk/RtofF4x
	SxsjBrl8EMJQUyf9IbdVp1Kkf3Ov/9iMVU+qYILRHQ80s/FTqKbeAsCdcCIifPYm
	qQguOivaL4NEWgFe/ZZDj9CPwEVNJVVlZIKbYGV5HOdLSWGOnNn4ayu09OWHKM5A
	pLK2Rue2VTs11R8os2eWmHiavQxvSD1MSHOLPNMkcUdndOq3w/AVWm/RhpR3RtwE
	1hpChhkUrek4n3LkgToNrUj3GFMofKy2/YGBck3DD8J/sT2qDTMkRM36+YjhmM+J
	t2o3Vg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd23vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:32:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso466283eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447939; x=1796052739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=MTYpjMD2QQBERPaZLcFvcdi3HK+YRFTwD9VXKk/QbPGtMqSoqvh9xHYlFJw9y+SYgD
         +eIr+FTPq9bnLRWRc6pV6F31+MBgbxhw/abckQ1JNU7oQPCaDfD/8McVVN55NXs7U+aX
         NZdNCZo0kobdV2WtjPMtE3HpBVwr9c3C0IbKXCIW4XVd8spmxk/f1Sh1egVhReB287Cj
         eXBQ8usEWhZ0Ic3avurBUPlt3g87pBe0pImO445Hp4gGCMlD+d7ifyH9sHxNSGx43SvK
         bsHxZkcoUURDDoG/Po/jZixHSThhYGzDc6MRKLBP3eTkFiCrnMXds0Uc83HM3ojtOHA6
         oR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447939; x=1796052739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=XHXr46ToHiRCiE+IjdFQT6wmaSlpWcR4Y2bieLHMfmGiO2z/A6W53NbVc4+vqRtoRP
         M+Iv+Chsqa5QbXqrzTwPKflwFHs66N8Zk2+4b8HqWeKuaE7igGvc8RbtGJB9Wvw3XWw8
         DFBnbGvF3zBfeSLVnkxVVy4pESo29XFfBBaOwUVPV8kEIOqYfae7lv9PAVTTPNXN8tLT
         2KpaoNQhzOjh438OReOj1Tg+KdshvXvOOglspAbl8iC1v1MHQp1hflGVXlYcGn0LjlA1
         aR4thL9uR0ekUOJkydbH82pgOz+b6yYxPbhmKfrOARoaztf2oz7fW2L6PssDMErkeF5g
         k/VQ==
X-Forwarded-Encrypted: i=1; AL+hErEFfVnEE3ltt58cmP8t8KmoqriEmpD6Ec9m7VzTcJ2Vx/tdDksHCWfeQUPZQPDXAF6CENarPUnUXrFibt8C@vger.kernel.org
X-Gm-Message-State: APuU4Z+uKPMzOW2fdnw8otH4fTA2wLFOxENMlbyuGv1NptbQS6azBCU2
	UOfxAMOgbs19NgEXHfDQ17gFwr4MLOwVIck5rk0zYmyi//PNfkWHnmitERKqce1NpcHVWUbhwDD
	PXWB9xewc/TJTqTLz43gCxCpU+I8SiWJmWivgOp6w3yuoxJnkjmCnSSYS+QHwjRBcWOpc
X-Gm-Gg: AZFdTZdgMNun+FVdDDa39vuyGyfwuT05mx2oTd3RHG3QbpzPTVO7i67t1z3TS2uEaCN
	W+nn8Fcc2z6Dj0VAqMvRAfKK6hc61DsTlkQ1Ezk1lgfSsLO5Pf7k7fugKnBIoGuYKHlR/lcS4sA
	xqqK8VdZW/zYyFayL8DQeGNWeLfvn01TQED2sHnaHR8pXwId1Wbpyrda1jwoD5D9gYHQUEG76zz
	CCJpyr6Av8SnJB5q105COwfgpDsX6JyXv8P5AmdUEwMgDMAX+kgv/cda7kNHy+B9eut+WRgvTBl
	VXg/V8hUUUVtw3OqgUBChrrVKFLV7edsY6btxAx/sGfB5W9BgES4FJxfMXZs6bxwlitY6PDsuj9
	/OqB5q4gPFjEti9J5baWn33F/Kzjx0mCDCWqPkEIeKAWpwopxC6IjPJcypsXJyaS9wXIW2KQ=
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458791eec.0.1795447938646;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458731eec.0.1795447938084;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm5516406a12.9.2026.11.23.07.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:32:17 -0800 (PST)
Message-ID: <b777e26d-98a1-4cef-96f6-cdab7918a1cc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:32:13 +0100
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
Subject: Re: [PATCH v6 6/7] wifi: ath12k: Add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
 <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vp83zoeoZnQzJPmZlFJE3DgEbMgYqeug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX9YY3ScrwmQJg
 ZfOeR0ea4oWZEDZJsksbWgsC6gabJUoYMJTm+KpT7hBG9pvNzEfY9U/mzFS/uZFl4U6yMSixhQa
 fNGDV3KKGnCgTSMKdd8jOMpGt8fHTaOsH9sxAqJ5qetix2MldtPnqucWP4GtvdROa/+61+uuHkH
 bWSoKtnkYEPc8aF3ZU+7maE4MivRy+W1K35V4Kpft6qOir5KTu1R4r37dMZE0eLWbKDqyr5bZwq
 lzzlh0qMd0Ro2rNjOy9HRELXr52kqpIJ8d4WU49rV1qf7O3Fm1uItLRUbhdw2r0YXyqPKvDjJ/D
 nH7+gbciDqsKq/QPD6ywHLh5TKfa02aWDUzYhTCV3NUC5ZCs6ExNLr+61Ttnr40i1CMc9vL4MFa
 Nb+3/kMFGo4MNjv/hknCylcuHBuCTUIDWx5oFG0pfbzKbn4legtqkQhM2veT7W500KV5++RjyH0
 ze40lnRZEXbK/6riAjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX8nDmvFnfi2NT
 9mvL3ELtGJDJbCYEoqcyGc2gRqo6Z56ydEqUX13GhDdRz4mWHYtxXGw51+A1LjbRBFwClzCD6ne
 BR9FA9juVdpT7J6FW4n/IONL/57zeLc=
X-Proofpoint-GUID: Vp83zoeoZnQzJPmZlFJE3DgEbMgYqeug
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045c83 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EZJCw1MXRrN0MplZF-sA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/19/26 1:56 PM, Krishna Chaitanya Chundru wrote:
> Add support for MHI bandwidth scaling, which reduces power consumption
> if WLAN operates with lower bandwidth. This is only enabled for WCN7850.

Curiosity, not necessarily a blocker - do other ath12k chips also support
it?

Konrad
