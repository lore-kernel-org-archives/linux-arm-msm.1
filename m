Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216126;
	b=YyKOBuWe0Am2yssgw3qlXyQTr8Yn87g1RdI7LlS7087BDx9i70F1ZuZmVphz/Q7u3O3q
	 H2zainF3vekJqA9cfReldOgiRpbe1h7vhRWcsxb4V+kUIqj9koHcQJUsNJDfuJDEbWrJv
	 YaSLsYz9em63z/nWo1zNtWSG6CrCeO6zk6WMRyN6yltkDVK+byYG+xlLiF/Nsa671pUH3
	 lOV+PJTomMUD6ypfNwQ6dS1IT1hJESccV1gUjLVseS5Oq7Zwd9L6mTYHTTUF4RwiZzVHj
	 4T9Uv00yOfB7X6bK7x7WTWRH5KhwcKniSoCQodJ2zdvLqfRSOVJbfcJacVVQMiam8DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
	b=2qAWIqco+y6qtlHOESTH3uzKmiynwuySHj1lSH9xkY1hPsXuPQm2Po+oIYIdk63cz1zo
	 MsT8Z0a00Osj6UUkuZivJRprtbMqpo5Q9IswW1edvYAbuaI1kRplkOtlNJMM7S+gsM5Io
	 duc4oQ7gaORpiggrXJxIHbnsuaPOZ963rlRHWABC4fo/l5WuIA9DZ+7XzGOdrG7pHc4WD
	 KtFAW9UCwAAohYdR1cWu5YBUVl7mL4aUw1rm4oUTGVdQU4RfkJLgflfXXe7hFU03PEwlE
	 mZwqJ53qaJXthpxfEXKoh12UvacKuSk+iVZPdl4QBwR/d4AAua72jAyB6wK3y/9de8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyaJwg5o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/7FYHjD";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD4606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AFD4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyaJwg5o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/7FYHjD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969xPw3611047
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=; b=OyaJwg5o1UPg/G3/
	3tkg6J6KlESn9QfzWD/jMmwRJFxa24MSYhsK70Kj5Fmej71cp4O8lulJkw0gJqRq
	42m+dR85V2cv1JT5Dz4xESwFw04lE5ibI4eVZn8YY5FrpQjPRoW30tj4EbzSb2gN
	IaRUleqi0C80g5xjEXQyxuk0pbsvjT6oOSEHBMXpjiXaaHy2Fh90PY9Ds2k5WNQR
	yrM2HzEBsepiTCMYFefGT5c+9sJNGtjXUfHMpjjHsRfveXvaN+zpGp63ckOUlZzR
	eftriyugGnn3rEdTNr8nt+SJ0k2A0oY5SFRtzLWVgGIPJFDMe+xiRXQ2cNaaoFd/
	F41rxg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx28j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:22:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so19243785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216124; x=1794820924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
        b=Z/7FYHjDnUdXbv5V4BY3NSr73Uz3hdjIuhfVMqZyrSUQUJ1yx6fu3GKtgAPXDJdTi/
         mgSzn2LIgydf+/2+zHaWQFsFC8P1ReUz+8OS7u1/8+C5T+/oPfGXWyAtTjbZpfVLxXkb
         aPNe5SzP8y0aosy7AHBD0enSS5Lmy8pBpA1PlmRTyeCn0v8McL+B8nNhGzTU0LHSdLbT
         fVq79M8FBE++rn98yGz/yJfSAUE6fpVNFKHyu6aSE3p4G9xA4uHArRC4mzo2roF3VyIk
         0KclmdSoQeinmovJWJNC5KZjp4L0sPitXujRxdN+S+C/20MNSy0kOL8jhuUSemMBvOe2
         WD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216124; x=1794820924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCjwWNVFnlPBcw+WRAE0V3K0CIuZJfcbywYhC7VJch0=;
        b=xS0rwutr5snv4bbytE8NPCY8hCKRnmoZfk7P0uHj0HVAN1/QAH796tCYCdHP7nlxG8
         mS79XxlamOjo082zdTN5+7kHd8QxU4YTgB/ZdHPW1orw733W0YFR1stAG8oWmGujW2fG
         fUcXyPn4K8RbHwAmo+1McnuWhr2B/PnNvo14P5Sj1O1boSd7IiipQP2BixfJrBD/XXhU
         Zw2cgDA8R3M6zBZbb46Vhx4kC94scvqrLE4RTZuukdbbrUQR/3p2kMsIVHsU6VtvPglf
         33JbJdqn/xigDu28Qp9dqOfOAsiDfHoGY6IB8g3RRyJKHXAYBBhjeZAeufip3nDXQl57
         TpOg==
X-Gm-Message-State: APuU4Z+kmPEuxWe6laOjJqDl+ujzSlkayQXDvWWMHVN7lG1+0HtiUI2a
	ieVKM5tW7uZTTl2Vs8OZQ2Y/75Cb2HRYzBkrZNxNPoP9HawRozgB5SYzpn2Nt0CtJMBu4cQEMFD
	OVY1tZRlBzmNm6vow8Pdxp0/2GefX6OkIYS2YY2rCcVLCOrnW+6hApsOuLLBCdoJE5y6u
X-Gm-Gg: AYBFou19Gpki+5+HUygDpLABDpE+bfRI8+TlhGhpKzakNYRAqMw6NKbiiwF6yd8uw/V
	O18tkslvpLCqNaDXToWcWt2wC7ln1BqZOA7K6kEXxqs9SpEPG+pJ9dS/jAwmErSs80TBvqOEpYI
	L/Y1ZEXRU+xMxgSWp0mL+nE5TyPzPMoZ6iJiBkYpk71EBY+iipFcpIgU+5kHIOmouoMdIUi2BU6
	Fx1gJv4ql2CLtNCxfgJWIpjn2rzAAIeTvVv/96o6ynl2BaFbSvPhUS9P0dRhgA+Ns+yG/Q/92cc
	jh3KbWK0YDqgRPDsZsMVydRmrkNRfF4QNJwbrXMOoU1AxX8q0tjI8HXmwnBpGOuL7LOxE3Rimgy
	9qkNwuBQd+JCvtZbORJkbS0vCuRAhnFYYNcmaeUKnx3FnNhy1bZiligDLvfWEIetzAbxkQQ==
X-Received: by 2002:a05:620a:2253:20b0:93e:571e:94f0 with SMTP id af79cd13be357-9478421a383mr520622585a.3.1794216123849;
        Mon, 09 Nov 2026 01:22:03 -0800 (PST)
X-Received: by 2002:a05:620a:2253:20b0:93e:571e:94f0 with SMTP id af79cd13be357-9478421a383mr520620885a.3.1794216123390;
        Mon, 09 Nov 2026 01:22:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ef33f1sm1191344a12.35.2026.11.09.01.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:22:02 -0800 (PST)
Message-ID: <3d4e74ca-5dcb-4370-a7e1-f4c1e2b3f9c8@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:22:01 +0100
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
Subject: Re: [PATCH] rpmsg: qcom_glink_rpm: convert to
 subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: osyLIJbN52fAch3nm8pVE9DO9cEZOTS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX8xAYgVPLZUh/
 Rds+DHnOO+zDTYWbm2P/YU86aeRGPc3OE8fksq6g76doitNZxMBM2tnPLpYteJuTb/QpjifOinz
 Pygi11cNAvkcJdQbACm6ZFsG5tnrvcwQAN1vpEkbyxZ12IBgeGE7j9e+VJOxECPU8GJ0PXYXaCc
 XY9F4YRlY8auPDgD457ex9gtlvnHl8ncX0ehARg+nDUv25JUXomNOOeLCpYmRUlL7/AmlZMgOZ6
 poDNo1tLXJFcm161IkYIBgx2F+LECr2bxbdIWkYXp8sWWCyraTghvW9ia9gXYh9GLwnrxVlposf
 GGtPSzt8JJ2Yplv2tZjvImdiAuedDr7qRcoloP+cv0Of1iSjbFbuWWS6LhnRISWEXDMjnXPC4H1
 D6GbIBcIqEkEz59sVUVdxkL2MyBjB7iYqVYK5YZE5tOIiWDaEs7wGeK+4yxkdfdBX/Y6qRaXpID
 2rYlGEp4Wwi5kRDBmKw==
X-Proofpoint-ORIG-GUID: osyLIJbN52fAch3nm8pVE9DO9cEZOTS5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX/3WmLeUPBNK+
 TpZhaANLLGmkehi5dWuN9bBNDjHwvISmh8DTfNE5eQ1qPIavvZmNZeOtDPCrG8pngRneE+9VzBz
 JCIawp6FuodjFpXfDHIJwnbBZ1TtWtI=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af190bc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=2mfksfQnj69i5T-jYpIA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 1:31 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
