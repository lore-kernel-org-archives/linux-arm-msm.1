Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382449;
	b=bgCZGB0auvl60AXuRbkz5cNJjUzjVE2UcRROemKG8Cci0lOEIGT1tpJ5y1eEVvpg+DlM
	 ZxDzh1Q/RLKgi6kEFrPolYPkSrI/FguokRwqyc1nCaDduxuhy6CJL7Uf9rxZRTcBMS95y
	 Sh3kTnxnZT1cCavU5h9+KZEA5Sl1kqSK/nPdsyEQKC67qbWggaL5mmWCYqKs5NxwlwAgz
	 WcM0UVyjWR9esEkFpLPPTNAcatRpr9ppnGlN/a/bYVWHgNcI311HhenrjiJuGd8kxMmlj
	 DxTZhGrYveoJ+Mt8HQ3NRDQ76p2H19d1TxqDh7iH7nhQcLgnSXTsjkD2usQHaIMxZ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
	b=Y1Ak2ceHprzrD0ql76IDIhvJqxv284Du9a/3avqr2PBpFqUa34BgSTEjhl9m5BIOHvqe
	 ZjI3p9gwy1zWi9XE1lKAzy04O67NnJxUBsyx+L0ezQURav7zwrj5aSys6gBJ7BcsqrI/A
	 BUnKx3GKEwO9IKfRnUGZT25KlTu3lOiGTpFZ4e4DGgJmckwAiUm63gmk13XCLjp2Wm8x8
	 rQeWZHh3+VIV87Aq9zY3d+fZ6PIAjLg9r1/1DWZC6RdEQ9tvuRqWaT44ZlcxQWb+zbH9t
	 JmBuKx8RDOqZgehFWNz/CqLoUNVrcuaTsco4OBczbhtl/3JVLXwP1gVYkmBRYMPAQ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q+uOJQx6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAtypqQg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F4606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q+uOJQx6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAtypqQg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERoaQ1953767
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=; b=Q+uOJQx6MN7bb3Qp
	RIQYTGJp2FfIusVoQOW4c63d9kjqf9fxZE5a+4AMLZ03E3UWZKhYtxxNDQxmrv4d
	D7nXu9WxEBKPvZXkAgtmE08o/m638bt1LeKz9gZqzO9Z1F4WrmKB4hhO4d/kw2/Y
	AByqDlV1dclPMk97s/tXSR8QqMgqvUPrMSzmAy/GlYXH9UH+KBCu8JujNQHC6D9i
	evxujPQd6NPk0uS5cLyla83tXlWHbJi4/pywcNTdQg7JBet1vESc646SDTrxon0c
	UGQQYWMKkY8K/GpKNr3A8akHe+CgD7KJtltINTYsYqKDqBvtnA5bqsHO9TjFGM9A
	3+Zc0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pmaag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 17:47:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1792500eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793382447; x=1793987247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
        b=WAtypqQggD/Fr0zt6j/gkIyY/NCMrf44hvdYgTKN2FQ0Apb/3yxP83wtyrKdXzBoOl
         Mk29YcqcXlsQ8vsAIv5T7knA8QvP4X6IL5oIr0oySJBgzUhfH9IgdCecjmN9z2CUqUE5
         /8p806PkQ4NtCeog6eD0NidvD4lfk9zplbFs2JkhEL59yUvcSTBkdhqXEsOMTL3VTFGV
         zmSFgrwGr/kLZBsAqvMI2096pUB6hdHXVZwpsYRvRtPokyR1uRAm01dGx+mw84Z8mwuE
         T4qIcMiQry0zqGkH9R6J6n0K/bKQbVjz6NUIjkboelCDF7aLwGN1hyPhrRS9DGSoa9ls
         TqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382447; x=1793987247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
        b=tGWuZMp5sh56aNa26hJf8DC7pF7qNIZkyYBLxT6h+4PNYdY176rAQ9lFtnEa2VGTwH
         8EaJjadnbxZdnVTwaesUH+AvRJg9j1LlLOyZYPD3MD+3h5eIqitGJz7R92qb19rUF8yW
         i94DdSyq5/VtjX9Wp3UdnO62zPxkxBW8/7gy8wU3hCEaVrbQuiNq24uXkPmovyDaGnZm
         vnD8cGcNcSdYL25wRTAGKKVtuYpvDhKmTZW9auJwRpEzYb4fH0MdNfs3LC/KFtQ3d30H
         HMak2G70J6YjxDtKgPjn3htXbGCqf4Tt+VktgigADA5cyusnyxUA8anwawf5uySx5a2j
         xuGw==
X-Forwarded-Encrypted: i=1; AKwUvByxRYeEGpTfSwQtnCyyFjXyFQpO5D6d3O2MZs0JElImTMHuky/J0lQYbl27/9e2eqkPWbC6ubC2VVVszLxG@vger.kernel.org
X-Gm-Message-State: AFq9FYIA2R3bGXWBqdRK/oYFGvbsoqBWdRB1XsbSILareTMkiWNJ7Onr
	BouOnzWDQkXk4WYSAWnxR51ArRBCGLqWfBmnj45otbkgdDJVqM1DFMgcLrgL6AxWfxgwbKCtmcJ
	OdcyQc+cX3UpTCNLrgkSNphg96jt+C5VDyxla4F3OSzGYNWU1iuo3ej0JfSYcVaUDFOuA
X-Gm-Gg: AYBFou2sIOREGebZ/X5+SbkmHT62xoKXfCyt2jcnNrquN/sqTiLxMQyeYbSfVxlXYaq
	TN6iQyNVRYUNqBWdNDsMI626pEf4c+5tpoE1XhFEAxlT49BcAZHrWklTFuFdT7c3T6IUglb85al
	9XLCMpE0weDaALIygerllr0p3Sm5MLyP2PuwAo8PHrCg2RS+QuyP/raBADkcd5rmNyLcE13/B6Q
	w7oatGErvWWY6PCwjc0yOlXLse9tHd3TTW4BbzYQkrABPJlEK+kjSARtTKdqGsUpyFrHDNpR6fp
	GXV7M9IN3ByC4nmfTA/JhYChabXCEWL1TE7I41vCZv/PvrBKDoiQfHmvhHKjimc1ND4pQjyMzby
	T+TJ/ELoNq45g7HK110cXtrtQOYFXq3yxRLh7KOAB9W5lnjnX5JDAgs8hzL8MOoZtPhKvmvrXaG
	Ew1OKQAdZanGsbhECVf0MGT9A=
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr5894606eec.32.1793382446875;
        Fri, 30 Oct 2026 10:47:26 -0700 (PDT)
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr5894546eec.32.1793382446272;
        Fri, 30 Oct 2026 10:47:26 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm8787868eec.19.2026.10.30.10.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:47:25 -0700 (PDT)
Message-ID: <683ca22c-f0f8-458f-8323-214945ae6d45@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:47:24 -0600
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
Subject: Re: [PATCH v9 1/7] Add documentation for Sahara protocol
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX3AQGH4V3pcpg
 YKBQUeQciE8egmy3hZ2UigSB+1+TkC63P7kwy4L6Lp5I0EzGMgDet6acLSXp4StRvp8Vgwoq+bV
 xkaZId+1+9RK+cWpkbQkIXrXlLB06fEfZQxTZ/c0pvlKzpwdKg+VB0EfRX5G/gkp/SBDIStGcvs
 htwtjMI3T53jyxKpwVZHJ7917eW3DhGFJdQWB2OTRmcDvaGtMynY5MVYURSxLj+0VgYkb6Q/g5L
 GSbSvM04rZpvaH9nwPiemV6nQA6R/buOUgjzcNWm1z5/P1vA8U6V0a6MeIPQ475BsV7/l79khNN
 i+h64OWohdAnrqrzjimdfSUnvjg8UjbJ2BKTgf4AEOAQ0ffU7Eq7ZCdfEJdd+qSl3nfBb53vVM+
 hmbQrZBQzr45XHdBjl4wJHHdPWVAxW5vS6nu4dyH8VfCIvB9WT4E0x/pl/3PezHReS+Cc2epo3h
 CT3ds6Xpa5v+K1cFLIA==
X-Proofpoint-ORIG-GUID: PS-ffuda2feAs5eimjgXudzAxzSeQqz1
X-Proofpoint-GUID: PS-ffuda2feAs5eimjgXudzAxzSeQqz1
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4d82f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dq9AVsfMO__Ke9BKiAIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfXwixCdRbtCR3A
 R3pIRXxWQiO9Yx9XFgJTcLnSdhWb+IoJQHii5W77pehcsq9u21tLGz5AYPSu6SqLDrykAXE3a4Q
 AtwcIuQvfZm4Q60UaGrueifd20ZxySo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300070

On 10/13/2026 2:45 AM, Kishore Batta wrote:
> Introduce documentation for the Sahara protocol, describing its
> operational modes and their respective functions. The image transfer mode
> enables firmware transfer from host to device. The memory debug mode
> allows extraction of device memory contents to host. The command mode
> facilitates retrieval of DDR training data from the device and also
> to restore the training data back to device in subsequent boot of device
> to save boot time.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   Documentation/mhi/index.rst           |    1 +
>   Documentation/mhi/sahara_protocol.rst | 1241 +++++++++++++++++++++++++++++++++
>   2 files changed, 1242 insertions(+)
> 
> diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
> index 0aa00482aa2e2d7ec4941154a8c6947dc0a0ac40..39a38978398b81727514ec95dee4e060a1063b34 100644
> --- a/Documentation/mhi/index.rst
> +++ b/Documentation/mhi/index.rst
> @@ -9,3 +9,4 @@ MHI
>   
>      mhi
>      topology
> +   sahara_protocol
> diff --git a/Documentation/mhi/sahara_protocol.rst b/Documentation/mhi/sahara_protocol.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..3190e3e5a2820628e89efcf759c9ca634428f8b2
> --- /dev/null
> +++ b/Documentation/mhi/sahara_protocol.rst
> @@ -0,0 +1,1241 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +
> +=============================
> +Sahara protocol Specification

I think either "Sahara Protocol Specification" or "Sahara protocol 
specification". Having lowercase protocol sandwiched between uppercase 
words seems weird.


> +Hello Packet

Until here, "packet" was lowercase. Please be consistent.

Also, somewhere around the read data packet section, it seems like you 
stopped capitalizing the packet type as well.

Also, did you run the make doc make target and look over this?  Also 
around the read data packet section you start using the section 
delimiter "=" instead of subsection delimiter "-".

The inconsistencies in the formatting of this documentation are probably 
going to make it very hard to read.
