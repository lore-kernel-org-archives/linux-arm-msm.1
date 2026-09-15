Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6247124E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478297; cv=none; b=fhvpzl+HG/6Lmp46UhAl9S0HSMZNh+o49PlQY2TPtX9lb6q6Cq9bzxHOkT7e4YUiT5TkP1CQ54pLpfhrlSdV6XC/MLgZ/4FmK4iIJap6QyvrO3w+Qq2+Vc3LedP6oat1GlkPEr04J59qpUROHSawsn4EQDhmfzxHsShB5QyPV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478297; c=relaxed/simple;
	bh=fMMT7KDyQsoYNCmheCV7pMEdLKReWz7gdFZDpKI1mGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1eZc8NQbMVSOlpeR6qgdkPVNIdaFJgv0ZIZQBg1enVe0jMJjO9k4O8DFFNZIzBKEDoui/PyreXbMbH0PBpyiWiFJCzmcF8uS/z8XPgBJz73jFncy1Y57i77vkKqw1lAhkBLcSaHPDXpNh1xoVfD8faR4LuLIxdXMFMkOp1kM4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OksDAJrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8FhoUyu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OksDAJrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8FhoUyu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD03lh4006003
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=; b=OksDAJrh7ug1q5t5
	xcJdL08GNas8SYYTIuGuT7iztPVflBn8nCP6xLNqJ4yW9AjA1jJ6W4Z2ykM7mPby
	/b33Nl7dOIhIh3RztKQEPkmYEkM0qzq96ivGjVXFjP5x4dZeoPqvZQCWs6YVKdog
	JfymjtlpDoDKUaEF3vpiqWlnSlHNbI37OaT9WBsQNiAQqDRUAItMKg+eU5xLjoAC
	LPtbrt60R6uby97mA25Wqvz+pMl+nSwucY/s5Jhzf+YG7vAlnEO4gm95z31wU6IQ
	eWFRfZwjC8EoEVR+5B6sxDFERzSt+i6MurqPikoP9frM+LcaNodKNFGgfOzHPIR1
	148WOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtrxm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 13:18:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so181817985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 06:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789478293; x=1790083093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=;
        b=Z8FhoUyuOLGvFXbcHnebjO8Jrefc5K1afkJbXvJsMIWxYu3B4Q1O0RKCPFkEy0KhNc
         0eMbIIMPZm72XIeA6EjQ7q1KkUExGcP/CWovjcSgMtX+C4lnAieAqtFtCAqi/ltjALGy
         aYtb6XC2BdHaP/unB5m9o1CYvGEMxIIKuLJ6Dn5J+rFr9O1S5qZo9wJyDJ3LQSgDUtZu
         nC1JD4j/ve77/WI4Ck8ZRWo4a1VcLXK7QpHat2RaKQv5wnp2WZYPnkNX2NlPfKa/iM3v
         VjxiXYRCe6rNBFH/HZahiP/5p9mSV7Z4zH2yFvfLOeFSC+N4zYP5Gc9QW8ntxCXQCkig
         XgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478293; x=1790083093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaXbQxZaYTp04ZjcgnSY3dyQBKVpM6KCTQHDul4VEyI=;
        b=QlmRc+RYc5gA+lypKd71ewcyWNYqcUVSgqATe//NpbYIn+2vHhszRAKJ0WvHPyAFU5
         natLN1RKdnekh9zRzfcN7SwiWmwaFZEgWXQUTPNzYOfvz8UlLZLvXZgn6quOU3Cbdxm2
         4sX6ElAFKaVna9Rb98mloHbCwfsazePymk3Ua+wDSS1hcsZ+ke3tRp+ZY91yA42/s5xe
         7R0j44WBc59tmnPHZhfejurN+C5hPMgpfJnIUxbY//680twlqhi4KM4gE57bvfkdcrGM
         6nuTmzfCZ2DrxB18muDpQKhqsnCK/dRnGQ7CmREGq/clSZ5+4o7l2imvBz92v0cci2I0
         yKDQ==
X-Forwarded-Encrypted: i=1; AKwUvByf9yEr/Gz7duMYctCeu+ELmwT20xr7D9RBKg5ITK9jEjPhGN0trBxI285M2ZgIwqT0x1ejgfP0VRbxufMz@vger.kernel.org
X-Gm-Message-State: AFuF++kxt5l5wRG5wCpG8WHcMXSTUKVolFD9xssGl6ImMHx2Pulw+baV
	3TFNhuP0y+cvzxVNAcXGQMwWt5RoKHLwtfiJH4CftxPHfgqOOROKtXe610zvpcLhxbvVxk/boA5
	Epz51gfCrG+315tACrB8NfCf/i1AgXOuY+GDuGPAjb0nfCH3aJa5ZZFeRNRAHVpkKrTB5
X-Gm-Gg: AYBFou2ocINKPGmAQh7mCGr3XZpZ4mQjDBphmxr0LtBmIYd/rNWQkD0m14k8o/tCc+W
	n3cuwTzb4PEZcDJIAvpU0EyYJuWwbvlM8kW/gZ7Tp23L6TusKtGX3p6EFQditkAfykwfeSTqgDi
	v7leIBTqBO1fWDNurEyPNQ1LTPj+qLl4rtFzFkPDYRT4F3k9Hpd2i77GIkhnwd0FdsFP3opKXmz
	+jbc9lb10dKWdI1KjQyjA4sz17C2bjB9rfnJyU1hjzG0UpD1us6iVDS3GXu+xG0tZlAbTUht2SM
	3CSMYUl0LxhLSlXI+fTjeB1y45mY8UCkc+36TMWRCaYSkLCshtXX4rSRY4jS42qB9wcqD1lNR+8
	5i81ynQw5t9jUV4oxNF//gGoozjk=
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr478722085a.29.1789478293319;
        Tue, 15 Sep 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:93a:3257:34b with SMTP id af79cd13be357-93a346fa956mr478716285a.29.1789478292807;
        Tue, 15 Sep 2026 06:18:12 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2966067117sm597020266b.33.2026.09.15.06.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:18:11 -0700 (PDT)
Message-ID: <bef1437d-6ff3-436e-bd18-2a430fbb355e@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:18:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soundwire: qcom: add multi-master support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, robh@kernel.org,
        vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, prasad.kumpatla@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <0097b59e2b96d692b9fb542e207ee43f9dd44a7f.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
 <8c6bfa54-83a7-4d37-bbc8-d3384dfc6ce2@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <8c6bfa54-83a7-4d37-bbc8-d3384dfc6ce2@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B-Ygb-AvoeK_3UryAm-bX7roDzLwPbLu
X-Proofpoint-GUID: B-Ygb-AvoeK_3UryAm-bX7roDzLwPbLu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5MiBTYWx0ZWRfX6q90m9x2/KVl
 lefd1sk2qwS2cqGSSGVzp15VaqRGPcl11uaJjr7wc84cRWs+nEwvku8vfLtxKgyiiq0cMyROIpU
 xkG/nkWV8zYDRC5u/brogpjLdI7Dahw=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa94595 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Oxe59_bkntSI8SC7MgYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5MiBTYWx0ZWRfX4M229EfE6ddy
 H5aXbsmhZfimCDUbNtSG+R+Ip1hLgLrhgZ+tHyIo0pXOILsMZGmymYozjIpumZy2gmL7j18z/5Q
 uYJQuTbnROvXoWaPNZ6CseR1+/TNk6JRiFCQIJBQdiFCBZMfCyySAoGIF9eQGaHZ3XEHn586Rjt
 uLxh4jmIY+kBE1wnNFv0go7Pl/MG2ksG8fYZPLpL+BtFbSHNkmimqOxKqAkGKJdyFzeBYEjmKUl
 T994TXcWHCwKTF1w0hVkA+959NMsNjqFnyusM5nk5/YV/IamRfIojffi5LpFjxOrqzp4Flt26Um
 zfeU6gDOojBXEfaNUqXCPjFwcmWkgnueQCQRP9MCzXXMKlaJGknNE1ur5mar370NoISubDphH1v
 /+8GtV27c8+Y7hhHW59lxQFGWUPxO0zyhXrb9P5qqGd9OFBAwQHPkaIoRniupVIzyXUkwC9mU6C
 tjBtNNScBXXix6N6hyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150192

On 9/14/26 6:21 PM, Pierre-Louis Bossart wrote:
> On 9/11/26 10:21, Srinivas Kandagatla wrote:
>> v3.1.0+ Qualcomm SoundWire IPs can be paired to expose one logical
>> bus with more than two DATA lanes. One IP owns SWR_CLK and drives
>> the bus; the other contributes DATA lanes only.
>>
>> Support this pairing on the driver side. A device link between the
>> two IPs enforces correct unbind ordering and keeps the peer resumed
>> while the primary is active.
>>
>> Single-master deployments (no qcom,multi-master-mode in DT) are
>> unaffected.
> 
> It'd be good to clarify how the command protocol is handled. Each IP is
> probably capable of handling PING/READ/WRITE commands in Column0, but in
> the paired option the primary IP is the only one that deals with Column0
> and all other DATA lanes are just data?
All the control/command is only handled by Primary controller, dependent
controllers only contribute to additional data lines.

only Primary handles slave register reads/writes.

I will clarify this in next version.

thanks,
Srini
> 

