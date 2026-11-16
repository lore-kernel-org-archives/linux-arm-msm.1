Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824577;
	b=MeehxWd3f+NVAzLHcv2Z12fNqSgc5UIh3BmkWeNNBCwvbbs+usyfYEdNpe4w1QUFuou2
	 wMu72A4p5sDF8MHXGPzKNO+mJLFu5eLxLNJLtNmKNfFot3e6GHTGO/qzWY+t7q/1gULgG
	 yIIyQ01plQ0d5WB76Juc4Gc/i3drg2Rn5uvyGpCxc8sk4MQfxgjVlt80nQX2dzUooxc2/
	 5d1cnTfd1Zjsuao/2RKGhYsPCyAVkeyRIqTtqrQ/Oav9oqaysz7h6+UsW0TGYy2zVc27l
	 +cLCDRcLvC/wPvNTQrQ9qMJ9rtJfFouRZZ0bWJH/YbEoVaQBxgeAnwGYmr/uhK5OkMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mY/m8G6R6uAHiT5Kg97RYzOdiA/Zxk6otIa5uzGPv1E=;
	b=iEKxgpOoWRhS9YIDeqSAmcI3X/852FMtKBllI8j57kgZ3Lg2IyOPaORvosLx4VaWhB12
	 wcztO4Spw+XrpiA/cFGJfWdAJJ6dSQtw4p/7TH4rQBDswT5G1QltiRFUFZwLv2reEidYG
	 5UBidS/Mzn2HP5BkvJY4NR6v1077MWeX73WtmgNGZ0d7HvamZ0LhDOcW8pCwc8l5iJ2HK
	 30bFj2QxaAumAmtlPlw2Pm/GG8B3QWDSSI8S5pgPx1Rrf1ZCIZvWaidRowXhbW63HUQ5l
	 MuF8IXnyfwhzv4NE6VycRw+FFs/7Hn0nIiI3s72c4C5P7F7QsgsPo1NEltXDrV3VfQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g/kJjfDe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmYtdGIr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C29606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C29606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g/kJjfDe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmYtdGIr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ewHh3488770
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY/m8G6R6uAHiT5Kg97RYzOdiA/Zxk6otIa5uzGPv1E=; b=g/kJjfDeQWvOqeQA
	QDBJoKbsX/HjzL2fA2ke7wlJ8QXcVy47tfVjC+zxDA8mqPSWo4h84bh+0ymht1xT
	nDJZiML1lsQFMvoGdmds09kxUNDqL3MJxNbyZlqoq//Qfm55BBhdc3MskIfVbhhf
	VIOUAmDv6gx00nU8MVMXW+9MfMhieDlmjadt6CeaWFvMN4d8o187BTjibUzI/YR7
	9LxHWbTjZqz3tYb0Amrn9PMf7ylzAdGME5Hy8D0gUNez83hjvneMvX97nOv0c38J
	qy1qkUII6ZO7I9UGbXtc0CmCuEWmBccv3Qs6fFq6xctORyAr7PclXxb1twri61dV
	0q+f1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcdx22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 10:22:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so2995906a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 02:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794824576; x=1795429376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY/m8G6R6uAHiT5Kg97RYzOdiA/Zxk6otIa5uzGPv1E=;
        b=RmYtdGIrvCADu0wtCCMqAM3dp6zaLBGJ96EnuENI8TvLyV5s2xdUvmv1sFC2TkMlSA
         teLNQnaMae9H5DxrFrCPY4LQDyWvZh8r7SI3rxm69UpzZXK0yxzQclUgi1nt+a+W5aeM
         39jQtZhIlPY86mNVR6qHq0Bcpb8GDNzzRphljG8v38VqHa72Sovnno8u4Wvf09oOWvIF
         d4Rv2r8KEc7teCPYWXBDU9fQckvcrcCUAbseqy97l3a1IlOpywAyK3hQEuLLvlZ+4paN
         U8O1kurUqPNuyoMCwV31TJYtFWWaH7G2fosrQH41Ug4BU0QoTsFJvQl8xFOhXAi10Xov
         Dq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824576; x=1795429376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY/m8G6R6uAHiT5Kg97RYzOdiA/Zxk6otIa5uzGPv1E=;
        b=0VCKxQXz41YkeBBlxjoqIdD49WdSSAltD/rQTeVMb1/GnDwl3rSgRw51qdDhbdyCjK
         n6/N+/saQ+nY/Fv3Q0GBxo3naSOKBmmkovzUECtE7iP2kWWVpu/7hSX4O+L9Sz2ZJvEq
         JXPbT4TfOqqbFEHZ2FXiSpUOm4kWG7HyZe6Vz0hYENDgohOZPezc2G/Cy318ipVCsvH6
         LcPUWlw7Y3leklt+ZvYHC0WBgscmuecsBvBdc7ln9D2ZnwTLpvcAan2abnCRSWRBLN0q
         iUQOC5cumUzZ4DfGnOqdplxlFvRC9OpVvmlC0zuJgs3oiS+YQkfcX7345Q+O17LO3rZQ
         x90Q==
X-Forwarded-Encrypted: i=1; AL+hErFaRcrOvpjO3ReR5E8i3wESqd8+nbO9Bcp4l2J6WphZ2QroWXDRr+hjN40aJIp9pH1o+Ty093wyoip+u4Dk@vger.kernel.org
X-Gm-Message-State: APuU4Z8d0sNLDVp2zptxr++hWlQ32wFQ3qwWa4sWaUrPsczfMorDoUmF
	g28mMaCwIz1gx2r/3YTBSA3U9F/S82yoG3QevDpHUM5dCOFyH0DZqWjJhKSEhQo41Thc34UgxHI
	zDRleiW60tBuZn6RdUJu+1y/gKU9Ybu6e9pkH2E1kD9h5Myp0HqcNfe+kXqu0OrGzmADG
X-Gm-Gg: AZFdTZeSVLxDdElksYxbRbkxUtdxkYAxw4Eztf46zM0AO4fcX8RMH4htRTBGYDhgaTR
	RxtmKyxWBwidEmytoW2XE9/0K9ajlpVaDkuKwLL8W45Duba4AHhKK8nNn/+aFgabvlMp3sHx0Va
	Ik0HxZOyPn2ogRLt+7u6RyYmW8pt++AKIYhuNLVo0Nz0leM7G7Mr34iiU1oQOSLUWamrcD7x5Cl
	eCP62ANQSE7YQF+xSNGiHRhK0Af2bw2XxAvE0a1Y+ZIRsF+D24N/wMiEcERxyH9Ddimg71cpXvp
	ALvloRDPYQOVYSU22fYBQAWn+7vXfccM8mimPy7+dR/T8IXcpFnfpSAeXxlAqHmBiCWCO1mv/QJ
	LT8wrKOe2AQElgxI1m+uY/XRLT8GH1CZ+riY3BVClgMGQGijH98JteF+3uuS0UNJZaD/hN7XY5x
	QYRe7ERg==
X-Received: by 2002:a17:90a:c88b:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b1b0ba890emr10201783a91.59.1794824575756;
        Mon, 16 Nov 2026 02:22:55 -0800 (PST)
X-Received: by 2002:a17:90a:c88b:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b1b0ba890emr10201753a91.59.1794824575285;
        Mon, 16 Nov 2026 02:22:55 -0800 (PST)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm21311203a91.8.2026.11.16.02.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:22:54 -0800 (PST)
Message-ID: <9472b028-d2f4-4007-a824-048dd1146099@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:52:49 +0530
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
Subject: Re: [PATCH v2 0/2] fastrpc: fix probe-time races between rpmsg and
 userspace
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
 <6648f693-ca76-4edd-99ff-9fd60e71fd15@kernel.org>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <6648f693-ca76-4edd-99ff-9fd60e71fd15@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfX2JlZJP7iSWPT
 8gw1XDhOC/uNATAOW11xTf/TRDWW2Ck/QHTwzk0y9OIqvMHrOlqCR/7eGNHd3xSqmKflMebQjUS
 cye6puCL7pvwFBwbzI0LNRAtF8D1Do0=
X-Proofpoint-ORIG-GUID: pGw0_goEQJ3YgxLfFJkg0WSZpTU8kJQW
X-Proofpoint-GUID: pGw0_goEQJ3YgxLfFJkg0WSZpTU8kJQW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MSBTYWx0ZWRfXy8lZzcvGhjyP
 imkjEruR8F6pn/eI01OYkkPbuQ05dEfZaRE+HrQ/MZA4ZyPULrm8FUS+hjUHg18vo/FlUedvkiJ
 R/ORyhLXav+OMkgWZFp5aVksXyNB+B9gLNq01zDw9G8obSNCbOD4jbZfZ8vh//I0cTfS2+p018+
 ufNZsiysWhCcwHOTEBv1lmT+17ChUS3d5Ow6gKde99TXXR7nRB2HjH8XCh7v7F2x2Thl7bYDhRN
 kvN4x/fVPnXceqEoYT6FO79XG2iNASoqCZI1zLHJBxxdQpd9OwNqswv35MekOyQOubGL6JsW/d9
 SNwHDSbF/kZKR+7kpq/+9wFQ9fu9j8nw3u7lD9nBm1hEl+rN/S22XjiMuF8Ru53zkLK7G9kOwS+
 rpYdB93USaQxUq5JO1EJNCXU9M5Zympv3xAo7BtqzRhTKHCbDyHJiMXebTnnDJvm11jQwXgPNDU
 qezE6DqFnA+GNtfjDug==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afad980 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Xv27ygMx39hFiU9I0NgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160041



On 11/16/2026 3:50 PM, Srinivas Kandagatla wrote:
> 
> 
> On 10/22/26 10:08 AM, Vinayak Katoch wrote:
>> ---
>> base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
>> change-id: 20260923-fastrpc-probe-fixes-30c1980b50e6
>> prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v6
>> prerequisite-patch-id: c8b4a3873f9cf0d69beff0f608933ae83faa4c47
>> prerequisite-patch-id: 05d9299adf4184e0e56d97dc063ab5bf227cc5a5
>> prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024
> This series is fixes and why is depending on enhacement patches? It
> makes it very hard to pull fixes when you add dependencies to new
> features or enhancement, Fixes should be independent and cleanly apply
> on linux0-next
> 
> --srini

Sure, will drop the dependencies in next version.
