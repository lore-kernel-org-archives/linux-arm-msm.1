Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830005;
	b=ESAoboDfVjhlB/71i/CP9DgVAtItJKIKLQMRYNSU866Mes0O3kDSyGPUfhElGcx8Jy+8
	 HBnZSDFVVATouaOGRFCtwMtuIjHq7Sg1klIggh3KYKfY+Dd8UxH3+KFxsfh437nzjVngD
	 s+gH8f2u/4UdmENmSGSq0y/NQo8zyb3B7G6NnQ7bWODFcvGG0MhINLMeNCeMrg6hmWWSc
	 pYRhL7kiNGHa41nqB5lmOcADhv+e0gzYWKmo2K3oyQChrLV+pqeOZ3pe7kctXn45r9nGm
	 xivvB8gNE1IEdW5UnD6LffbhiakvubRQDo3t0h+Vua/TazoveAA+x+er0G8o5AHTwjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
	b=NP5ZCYfLpl2xbkCzla/c+yTbu4fycfVnf9q8I/VCUNGfqWkBKqy6jwR+IeDo+17gTuB8
	 ErBWPHNJ82ofkn6kf20pYT1dwV0AqXZq+gV/f9+c25Dakn1GkETFNAr9W8P5Iu+dGIcpv
	 SFQW2S3jGmE6h+CnF8+jQAtbDt12jF8sllOK0RWrPavg+XHg34pHJtFTXLcrqD1+IB7m2
	 9pVqmENgjK/2p1JMh86z8uz940h731qoZxmsZKRLamAH07dP0msZg2NDeB1LRX4rrWdhI
	 YHA5Ra8i426TL8xamdtmqh9EBXyh/rS8EY/XE/QBVatiy//dQsN7MCJOBv+cubH5xSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhTyjEHD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egJTqpDV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E6C606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E6C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhTyjEHD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egJTqpDV
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O4C0jQ047801
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G27Cz2wceBx
	SG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=; b=GhTyjEHDE07M9G/UnEBw/TGNWJg
	BJGF76rSgOLqxvmOwTzddatBU6wrde/banDq+aEdI5UiAv2hkmxpf3ZOwcBp5JwN
	SpzH50PMrnZV1+LFn1pJ4wFyjJ2swVYcbNpUq8q36Yd1E1OxTlQaRnz1P/5eiZUX
	QI0Ts8R3TIrFk76dlRJTpqKPPJ3ukI4mG/JfXD/OBl7IIq37zY+oPH8ILD2firC/
	WvezK1PPTg9LOIMODAbKkLnZ3g8G42HeXZ2gfrUB+o0gJDqtYrx2hS2C21FNNtpb
	5bHG0DyyblXEaYq0wqT1SmGEK4FB0LVjyAtaQfnkoNgB+ypRKc/CGs+5sKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehge1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so9092885a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830002; x=1793434802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
        b=egJTqpDVDM8ojBT5Oz/kKJutar0kT8QEAxY7VnmBik3EVH2cEng64r6xhS041siq3X
         CMLH0vn816MOLw4ux3B8sFp2KvnoUU+nFbV5IOtmFTpNSXadd5Fh1oxz88kumHc88ELP
         D7/uPXcMQM4w/oIY8QlcKp7jLzYPL06NxJi9FUw3Nm8g73+s6Z6vZ+SK2Qmb0Huk/YNV
         9G1mjnsuutgXfK/yPqUWhHku8EkPwRqdouE+EKou8IVm/M3Q6qMdJ6JhUTU4x35OSQcN
         BBJH4VFukcvR63Xy4vkXyewYnVLq1Poe3H6AWXAjNHZfFfEekVn06JCKgCanc/1Gr7ph
         9aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830002; x=1793434802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
        b=jyEwU5Z3XkQ3OX2wB2xGzysUxTcI1m6sP2U6iW01/Aim1OUL/tseZLNk4yF3KCiRog
         eBUjCvbHGIxaKDrafp9o7YIoS/lVTU/nQXz5KcJukEhzYIwZQen5HviyVSlLQtlmyGyq
         diQAq7JxD56etg2DvLwQ/cz1zEVwyS8a6hDElxNe43Jp/RgnLsIoLNM4Fe9TGNMOzXkW
         uKQOSMTSFel/SnKjCVhxOP8/oNximEzH+iaMDzZfFyIf8GMgD7huln+telrsEn1RYvB4
         6lSXlm+bG3oMbmrS6y2jrRW5VEAL62bxaUX+v8rKa6DMPJ22zV+7u09KvUBhnGBa7HiM
         Cpig==
X-Forwarded-Encrypted: i=1; AKwUvBz2NEQJ/tHdZNfx/NCZqkU/u0WEXK0G9mqaBL9Gj7khwGU6rm5xmT6nT5D5cf8GkEmU7+qg9G+1HWol1Wzh@vger.kernel.org
X-Gm-Message-State: AFq9FYKtQpAnSWz3LYA+jYkIP4d2ZNH+2nukfQrhlecYqoi2Bl3OfhqK
	VfpwBuvsa7VyNZROce0J4x6OCnYIIDSbAK7EPn5iC7eiXGFWGud6j82hPvoNd2DL73WU4z3NoiD
	nudSXFMiqMfmmSSCVfQYN5tcrrvQgM7VVwnMzBCrTR7FBcW2Vn9IKRod5CfmyVqbUSBLR
X-Gm-Gg: AYBFou113s/fZUl+H7W9oEIoeMmbnm3b9XNF+TXIXch4bsiChorJoHfKHbxlJQ1uA0u
	TYLa97pcfMDh1yhnhWYu3eZqaFRVTZhvyoyPqIZP1AvSQJfAqva2Mira+AdweKcwyFXeg6kGQej
	aZ3dQSTf01Dga5Ik6tleE7NBNdLHUY+J2oiA1IrjfkJu57DNkEFm2Dxx68g0IvmJF4LjJRd6igJ
	385oxqE0EuHayygiI2qd++UaknMo4tfTuZI6qHkbvYWuBo1CgSF9rcQxVL0wLN90F/eWqk+6Qf5
	ZbaR0zadZts8z0ZRrGJF7nrNLp87kGHXdiw6vRBFtzW9gI71HStwEYp/bqn7Sgo01ilaqdhf+SF
	dqez2AqAv7oBHx6DOMBk9Er78
X-Received: by 2002:a05:620a:a881:10b0:940:f53d:5f7 with SMTP id af79cd13be357-940f53d1553mr32783385a.69.1792830002500;
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a881:10b0:940:f53d:5f7 with SMTP id af79cd13be357-940f53d1553mr32782485a.69.1792830002062;
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:01 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
Date: Sat, 24 Oct 2026 11:19:57 +0300
Message-Id: <20261024081959.2887288-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX4qk3TzQpoitV
 bbZe3X8iRv+uXcLO0+SYu06p6OWPnuSSwd2bwfr4ELJHKGZ2AYAfutD9Hd5H8TtNqtAOwG+Vn84
 vP2K1cRrsXHpGRPafpDrcCe+cZqHsHg=
X-Proofpoint-ORIG-GUID: _M3bULQXKuSz8pYhBsCh9U5Dpoh-gZzD
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6adc6a33 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dDcOnGmwcWcmha_HxNsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfXz/dn61DYDMvu
 iEIETkJ7O3nBaEOvvnzMBUZft9I6p8VdLH+wqlk6Tq6C7t0AppgIbSaDp4QfanLPTfNf0IaXKmb
 SxWBkQpf5rNWn66FYeuSNjpPTJvAgaeq751LNDzuKkz+ECf6LO+ibOWraaWUdYfiJT9ETaec3Xh
 l/pWVIIAeB1bwdpvJXd0yGF/yL31Nji7N/no06MaTFR1jzkiH58/pcjFakRxyNn4M7gOfP6WKlu
 CSyATBJiVuHjb0Hwl6K81H6Boxv7s8HgpZhbigfm637Vhg2Xb3R4ahyZL3SUWSWXJ1bpA3rNI4w
 8+QKv8Y+5QQEMy/PRv4/XNWR//AUDr8JcsKAGIuooh2HUddrlEKn5ttbyTWnyoj/QiN1FM1IO31
 7mgmHuQxaBnecX/N1aBwFpPHWBXdQ2o/fKdsdgkPYQxiQXvU8+qrXbFsxqAFE6n90gSAqBLEMH1
 Fk84azx+O9V8ukcRKhQ==
X-Proofpoint-GUID: _M3bULQXKuSz8pYhBsCh9U5Dpoh-gZzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240033

On 23/10/2026 22:44, Bryan O'Donoghue wrote:
> On 23/10/2026 16:28, Atanas Filipov wrote:
>> The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
>> use the same shared clock sources are not covered and are left to a
>> separate change.
>
> Lets discuss that change so. We need to represent shared clocks through
> CamNoC anyway right ?

Yes. The camera NoC AXI clock is shared by everything that writes
through the camera NoC: the CAMSS front ends, and offline engines such
as OPE and JPEG that are separate devices. Today no one aggregates
their requests.

I have posted two versions of this so far:

  - v2 added a CAMNOC interconnect provider with one port per client:
    https://lore.kernel.org/all/20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com/
  - v3 exports the camcc camera NoC AXI RCG through icc-clk, as
    gcc-ipq9574 does:
    https://lore.kernel.org/all/20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com/

On v3 Krzysztof objected that a clock is not an interconnect and
suggested fixing the clock framework instead. Dmitry asked to land
icc-clk first, then the optional CAMSS interconnect, then JPEG. Both
questions are still open. Gjorgji summarised the two options in this
thread.

This series does not depend on that choice. It only stops the VFEs
from overriding each other inside CAMSS. Once the camera NoC is
represented, the VFE stops setting the camera NoC AXI rate and votes
instead; I have that change ready on top of v3.

Which direction do you prefer: per-client ports in a CAMNOC provider
(v2), icc-clk on the camcc RCG (v3), or the clock framework?

Regards,
Atanas
