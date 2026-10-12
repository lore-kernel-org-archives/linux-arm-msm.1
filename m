Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AB249D5A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818902; cv=none; b=QcGrEnajOYj7++Im77Zxn4M25UONdtJ/4AVo6U1AXjMvTTEOwS9MY+8zWF17o5EZ9hM2fRy4NB1K3o0/NiWvDD/B3jfGjTnJmoxsfO/8JEHees11SD+t0fyuaai9+5qklEH9/PMoTb4KfVk8sNKjDIulpSZ8mpAlUooSOTPBrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818902; c=relaxed/simple;
	bh=fg46lxFa5YP6/BSzHdXma1atl9i26QcNJhb/fT/I7oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQA65Ax/9bkNg5nEYld1STOWTmUQE8RY+/smAa7DMPPoO8CVGMFGQ9lpCoIFniJN+/SSdeeyMNlnIqefMTNSISDLA5dlWdDVzP4Yz04SPzirr4vzEnB7M8EYLgwIJMhRH2EvXPA99wgmfXbt8i16seEV4+0zNNNkMEoOjOs7qVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZvhR4hm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8SqNNgq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZvhR4hm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8SqNNgq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Gwq3292450
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=; b=lZvhR4hme2f3qf3I
	yw92ewGL7tKkzb12W7vHDzrjibe+F9nd0ZROKARrswoB2e0I2ZflwCnWL6HuwneI
	3XNhynkFbnerdRFNl1pIyG+tqwEXUNzS+kKTJpeuzvwJ/AOJ5k/q/3BovjJFSVkH
	7VXL6nFpGzWTbqBdxbSNzxC2SJTf4Utjnc0wyTx0e8fGvDhHndLwzrmwd2Kz6F1n
	RbrQG30VSOxZhX7yzZyn21BGgPQpQV1qVi7UIzZRp7kZxR7Km8abSLVP8f8RdChl
	7X+KoFmyEchss8DV/nyUXytxpqFB0Vj028CA0ri6L+XvP3y8GjdQHWXp0vTBD4D/
	o/FzTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j270-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so8846885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818899; x=1792423699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=;
        b=g8SqNNgq3y+DmKIEnBbzf0HTraCx0J/cXGq95QXoz7F8XkBFx63ThotZKMXzQnsCI8
         v63bdUbEe89moWLldiS63D6Gj9wXeEKpM4m7LXR5AJdtzaJ4ubQe//eA3D+ffyva293P
         xKPdYxeVl5IqL8wksDsvSJ43PvP/umztVQ2tM2LGW9OfrxnbF+DAk+lKMR9ttiXxMKf4
         tbRpc21ObrIr/6L3ogiQW6cS6MA1c6b/rUQVa+5AYcetatWF/ZtwtlOKp84SWy3sz9VQ
         p8/bId8VnODP+pecOZXKC/xpb4J+YNVTRYqN0JXlIdPAoCLyx0UV5mCGmUbt8oSDPX7B
         0CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818899; x=1792423699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=;
        b=eZK+HJVvR1A7QsHnR9ugxySmgH5QHmXkFTxgS2mD0TehESqSO5RjblLwlM6T/hHQ8s
         WQk/s0uQSZHNyQ5VeyjrlUmuZHpN+bnNp5fs/C+cAeE3+MQm1B15z9OTRd/ono23h4HE
         W+JpUW7nqvYAXsvna1fOc3yJ68bOU7CPuDnf6hYcAmvcvuO4Q4KTZLDuMSTf7m7DkOkX
         2EnkkvE3+X9ZT7OVH86p1bfANQwz+pDDjoOMxa81Ue90+5JIZUByi9O8CQ4O2uoHtwQ8
         RjxlP221rgeXgJagePeShPqmRGyQP7Zw63qKomOi+6JoTj9+Y3EO1p34Jq4Yk4JJC/CV
         FljQ==
X-Forwarded-Encrypted: i=1; AKwUvByLzqK1ki6ynpSqLN6JgedjFYnH9+qK8uI1D1LVb5/MTRbkZ426dzL3SYzcxc4k3H7zLCXq57uVlfvOGTBK@vger.kernel.org
X-Gm-Message-State: AFq9FYIFZGWQ0oxXcklSLqt8lig4ev6TY7nmPXmAIpxyf0BVdCJC6HR4
	3pr5U30Dj8Xb7pKVrXRKmFe/wZ2J3ZqjTdkf9lff+hOx2Ho2mO4iSjyPnWYv1scTBizx/209w2Z
	wtnnhba56vam6mqyJZgjUX39IFRCuzhZ8NZVA57AjX2PEWcE1O5O7NcYHpE3HpCEOaVG/
X-Gm-Gg: AYBFou2Qs6c+OBmhETubcD6Ld/kO7/Rv/93wvV1CwJJqipyIIm5LMyF3eMFn9mZMh5B
	9Hi6IrnTMm30qDh+Su+lsOjar97s30aVSKF6/bu1ynzdAsOKBjGVHWYzIpY16EFRkVu6u/veS3A
	buLgL+ttA3Z46dkCrAPmyYQ5HEptfO1QH7DDAGvyL5ryZE5Jd07k1iK5fjQLIi+4qetWAE8tFUf
	9AwNllxH924vS+gmv5KJXe8XLlo2wPMALPg8qcdaog2fTE0R76s5ozmYGDhqTIdvd1iyxY+VLHk
	anqslw7mK3NjMzlkpsqFLwie3tHwtZJEHexkL5QQ9t3Scgxa44ATLov3PQpGXUJHgthBBLMyIo1
	xU9Lsbg0+WiY9kZZIQiyPCA==
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr1837694285a.6.1791818898965;
        Mon, 12 Oct 2026 08:28:18 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr1837686385a.6.1791818898196;
        Mon, 12 Oct 2026 08:28:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e012a7sm5067040a12.36.2026.10.12.08.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:17 -0700 (PDT)
Message-ID: <04f35f53-8297-4635-9bf4-5f7250a11d61@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/38] arm: dts: qcom: Format with dtfmt
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4XLF066/SuqE
 TBrt1Ge6hl8usDTSrCJC8ajbaWUC+sg/I6u+l5YQWPf0kZrXX3gqwT2KZmNkaSpVtn0Qn4EZd3o
 uLNBXWSZnl3DIwvsr7mHDAQXuNA2CIxZycSAOBd+oWgUNMxtisn3i9DOEoPy27QJk3JvGUWmDPb
 dqVQHmpyrq35rmM+wehoeA/u1Lhq3u7KwpkLV6Ws+UBXq3aDpqcyJVoOVCa+M4KrjEAls9b8rNB
 +nDYktuv0xt9tNhk7Z/cnxNDKHL2iCUDKC53nBeug9CFxP6sXgyLlgD1zbxpS1dnNv2EsgReiAl
 jTuiXj9ABSz/Km4Z9vNpOPdEMsYllggW9tE8w+bd7O8r/FtIZTOwBPKNsRUTPf9jP+h6b7QMxWU
 4DSSHm823nuWFNaOH8R2yTcq1XKR4l1VBfb6jbWLYXXTfJYbQ1a7R2EsT7RQ3qnZ5bvqXnYXkVf
 BMkfGQL+si2DWB9iUTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX0liJ19xM22+B
 4W7uBkKngpw+Db+4R2F2OHs3BdLGxzhKOlkgmDTP9UGN43pkrpMGIJ5VQJmWA5uw11ez6044tUu
 8J2VWMZmk2TCy9GDhCooLdxxaBth84s=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfc94 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gnF1rBiOnwiRTV_mejAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Krr1C-lc0aJ_5DbNreMkqANI629J_T0-
X-Proofpoint-GUID: Krr1C-lc0aJ_5DbNreMkqANI629J_T0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> I was looking through the notes for the last Devicetree microconference
> at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
> working on might be of interest here: dtfmt - a Devicetree Source
> formatter [2].
> 
> dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
> from the actual Device Tree Compiler's (dtc) lexer/parser, also
> (hand)written by me [3]. It is primarily designed for the Linux kernel
> and currently parses all 6872 devicetree files in the tree successfully
> (found with `find . -iregex ".+\.dts[io]?$"`).
> 
> This tool was developed out of frustration when reviewing devicetree
> patches internally at my company Axis. I would have published it earlier
> if I was aware of the on-going discussions at LPC 2025. It only caught
> my attention since I'm planning to attend LPC this year (especially the
> Devicetree microconference and would therefore love to discuss this more
> in-person!).
> 
> This patch series is only a small demonstration of dtfmt, primarily to
> get Konrad Dybcio in the "To:"-field (who did the presentation on LPC
> 2025). Obviously one can run dtfmt for all files and generate a much
> bigger diff. There have been patches sent for
> `arch/arm64/boot/dts/exynos/` previously [4].

Incredible work, thank you once again!

For some fun trivia, this is the tool you might have heard of as we
walked around one of the LPC 2026 evening events and kept poking the
various soc maintainers!

Konrad
