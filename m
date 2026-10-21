Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599223;
	b=h2jd6nSOiqsSDB9sDDqVgPoHqh/QgpjlkIp6xntFOZHrNDZBklOQ8BjKd5Lbk9Qu0evR
	 q6bcClb02tcEe+PY41DYqizjERgAJHaZZJpxHrNhoZCOzDBsT31/sdGTcJYBLrAm9dvCe
	 iSIiaG2Cl5eSZkYmsEit6L0eND5CXmqBdY7snPmG/zokHctje914lwh3eXvnOmO3hdnRx
	 sbzBYdj2z498ESD/0nhPBNYaZN7gyg8N7kdiPlGSRZy5VKKr4wLpIuwYeRNntQLPXLbZ8
	 g2tZSPHygsQ/VsddqAJAZsIpc5LGEZ/0XrLRgBt8mX/vyQ+1A6L6j+4qFTV/OCG0e3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
	b=J2ODzqHd3w2Hq1B3I1pYApUWLcaM00JjwPXNdL5B9vTw666FzWLIFW3I9qW4ASr3xbxg
	 45fcWBZo/DiHWeYzETihrZuU+6qcin9e4vbUfbr8VN/mZk4hh9JEl8lRzOQrpA9TKbNG5
	 /joaYX9k8AIbNOyFAtddihpuJRIbpwPwFwyemp3RLyLPj14439Un6a6ys5mTaCT3v1jhe
	 Bbfd6eV6jJBZrE66u4qTmo1h33sTsR0RKeMz5z3rhZXW6YULcQ13gcRjjc78/xTBZ937W
	 7NPLdbHUkvGW1tfhzmtG06BwYWc9NST9pbYTeJtze1kmngbEQuz2pY5O+DpZgTteIeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X49dvhdm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdDfqfrs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD834607D91C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD834607D91C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X49dvhdm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdDfqfrs
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU14C4158405
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=; b=X49dvhdm1Xdk9Meg
	9iHEBDxw43T+t+syX6G+w9CK0ke9rlD2iuQJ7VKforUmMpp+3PKkuPZDHmRAdyxh
	G9YlvJy7Y8ouNQNSCYgJoBhc+QGKs4AaNZxMky2BvaZkfN5lh6UAc716uTroUOc6
	G6jnrHZlJMo0AeAJt1AVsgoC8jZvOTc7AYYfD0gAG/V8fCxEray2rbWCZvYlhBmv
	QgbM3ymx1r1yW43oNKf5TY6tiUQYzQiGEgvbeJO+GG4UOMfP9gRHPeCXJ/G9KCxe
	DTUAhyjp2tvAoqYDps53mEraBd17e7MTDhkNVbbECCwqOIeAYEsXLQO5+A/5S06A
	0RFFCg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8sda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 16:13:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso237471b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599220; x=1793204020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
        b=OdDfqfrsXSHnJI2e43s7RTS8DXBpYycqRDzFyUpWV/H2j7pDKteEimqsPMDT8xs5oE
         scpklR+85p/2X9mlxybKHKnjYO/Yn+Gsq0B7UmzacJOVCydnnxjZowFdmvb6DVAqnDTk
         mzYaBa64Ko1VmyQJt5HsoQot/EbNKGJrb3/ERVjdX9e/38BwckhVBX6pLIdGBKre1y7W
         bRnCiaFXwjmITtIvVUlyOFS13qg/szRUWuMLEJ5BjqyElQwzYN2SvIFlj/+0upus7jwN
         yglAOnHhLVFQ7eFbAreORLMvK9ySu9ADfj/JzC8L7JccUf4VkTNSPmYzDG2OzdcpmSGD
         dylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599220; x=1793204020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
        b=Za+Y93RfZGKeTcfTQGWaCkvMh7KarTqa3HLVi7Yru2Xp0HNaweadA6Tbkg44tapNR7
         m9v90UwQVXTSJjz14YRNrJSKdfDIT5gMAaQSIsVI6opjxXiwVfeRMEpqReTUBwFRU07y
         CR50yGXdV9ob8nHOONR3tJWPI2kgfp6ZA7TayJ1kSDVy1UtIuxuR6kKrWW8iRmnigVGI
         +SayGCXd+K0c4xqdSnpWL7EQMIFnqi7R2gHvDjYzEjj6d5pTedcb5R9v+SOAS6xy3UbB
         rvYyZC9woGZs50cYrM6A/3rUNe3vqmsWa29HhQpG18mN5Bkd2TclZkqgAL/83YO7x8w0
         esPg==
X-Forwarded-Encrypted: i=1; AKwUvByvPr7vv8KWNRk2reZDPk2Iec9UeBJ00OEOTHfBxlFLjsPho6gIcYdNdBXBHIjIYND3aQfc3HI0oxgoJPXI@vger.kernel.org
X-Gm-Message-State: AFq9FYKYwD1fGCZXxqPDP0XpFv4OovPU9OFLztyuGMGYbwDfAlb9gzsb
	hkayjn3aPzs7LOSRjaGO1uNCD9O0yiP7sxtmYNluAwTJ0/annIiX3L8dTh346aInW+yY2qfOgJ6
	OupI8ljBoJOT68oSOpzh8I6fO5aPN5Hrlk8X/5FeDDFMXfqIdi/5b5t7XP9sMSGQPDbmP
X-Gm-Gg: AYBFou3sFMnT3uNJTu38G4NuE1HHzDVtwoHvhXZATkF8od/qvvf7dAbyAyTBDAh0fuy
	ksJFRmfqdhUch73Pj2rY7K03QXzDJZq/R/DbfmrY5KKGhmZQmW45YKteUajBi3kfoCvYJ926kfr
	bOT0VLlGwqeiDqsuiRBST+A6aoFEAANmNjDhz98ZXXk/LT3cRxntDes1aCKSJmUHjJDW59nMP46
	o7fbvBeAyMA/BFha4bKMMw8jIYZ4Cif0P71dGTzkOrKJGklyxb1XmH+KDLAbeMt6C/tG/+McFop
	qWH+PQGLeUT6+8pQIgoPUB3iZaf3kccp7RZYsi2Yo7GgHfs1mxP/Fpg5CNzX8H81EOOMStKCS8C
	UmovmOPTIix8o/nGavrSuD0Ky4CjZLKmQvVh+OTYxVbmE
X-Received: by 2002:a05:6a20:9150:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3e287e21a6bmr2249932637.40.1792599220000;
        Wed, 21 Oct 2026 09:13:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:9150:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3e287e21a6bmr2249869637.40.1792599218635;
        Wed, 21 Oct 2026 09:13:38 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm1131642b3a.41.2026.10.21.09.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:13:37 -0700 (PDT)
Message-ID: <4dff1a97-8c44-449c-86a5-5eac047ab909@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:43:30 +0530
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
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
 <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX/EpR70dP8gs+
 k+6qVXaGk4azZvNBf0b2eh+8g8cYLW/gOYLWI3JttMLP/uuXKla+qHx4tJYa/B7sf7qhX8SHF96
 IJs+wyUljBUgIzarHNnUwpF/YEnrfy4=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8e4b5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=L14mbm2-ywthVrTR10cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: rG7KnFW_w4FTzAX5Uwnq-kg0JpNfTjuM
X-Proofpoint-ORIG-GUID: rG7KnFW_w4FTzAX5Uwnq-kg0JpNfTjuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfXxlrKx5UByxUU
 5FIrcKJHJy112EXE3bez95UNB9bSCEAKzuN1NlowwI4cMWGl4Yi3GXonCZARe4GXfZDESGK4Law
 BQ5HMH9UoUMUSOrdz1G9gdsyf7dGkwTKdurvgXFyL/2raMAF1XacOM56QyZT0QEeYq7i6sgUCj7
 5/vkoulExCiyJscMzJCkzLUwhNnLyJ+JXAsbukCluP4rShcg9ithuht34ptbwBp3Hf3lgVoikQf
 j0Vvo6XBmvHUgR3pZ4uz1KzWpvsoKnjCM88C2OP9MgXCkL5m1vgW118QbBYrsZXOAqmfeqiI/ys
 NgRO30Vu68t1YHvLwk611mhlAJv7mRho8SlG1SwwnGaeaNnn0cFOOEucPIT7Qi1YEB7PvjKfUVz
 WTC8U6ju+QleaB4HOVR7B7t14vS67bkFXYbveXr+GDxugrCWxdlTEoqLZwx/95ZDwgl69P0l2Ar
 09Iz1WsSNR983EC7k1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210064


On 10/16/2026 7:42 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> icc_clk_register() assumes each icc_clk_data entry describes a unique
>> master/slave pair and creates both nodes for every entry. When several
>> masters share the same slave_id, the shared slave node is created and
>> added again on each later entry. icc_node_create() returns the existing
>> node, so icc_node_add() hits WARN_ON(node->provider):
> [...]
>
>> -	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
>> +	/*
>> +	 * Multiple master nodes can share the same underlying clock (N:1
>> +	 * topology, e.g. several CPU clusters voting on one L3 clock).
>> +	 * Aggregate the peak bandwidth across all of them before setting
>> +	 * the rate, otherwise the last caller wins and can undervote what
>> +	 * another master already asked for.
>> +	 */
>> +	list_for_each_entry(node, &provider->nodes, node_list) {
>> +		struct icc_clk_node *n = node->data;
>> +
>> +		if (n && clk_is_match(n->clk, qn->clk))
>> +			rate = max(rate, icc_units_to_bps(node->peak_bw));
>> +	}
> GPT has the following concern:
>
> [P2] Recompute the shared clock rate when a master drops its vote
> drivers/interconnect/icc-clk.c:36-42
>
> The zero-bandwidth path returns before the new shared-clock aggregation.
> If one master had set the shared clock to a high rate and then drops its
> vote while another master still votes, the clock remains at the old,
> higher rate: the remaining master’s icc_clk_set() is not necessarily
> called. Recompute the maximum vote from all nodes sharing the clock on
> this path, and apply that rate when other masters still have votes.

Let me review this and get back.

>
> Konrad
