Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459328;
	b=TscD8jvzlJ+acF2DucI5F/kg/JwGQZMBIDJVzuM9IMNipRtkQEUmwmiRiJXsrtkwFE/o
	 rhsmrcBQXsD/nnSUynzl9cozw98lHZIlQBrz0ueUp/7aVGzl8xgSvy9qm5j3KCdlm3HhQ
	 dtldnGqI/ouaoBJxar+getiip0BsgjtLS7N5WgxXy2oBKJ6K2HmCeyFEZD71iHtfuJgEn
	 nUNaAh8y7x/WfLYRlOWWIpEKK9JH3TYUs+94i9wRXYfbXBJWw24nrEuN2xha2afxUSFEz
	 Jra2pDZfU2cuDKng7u6i+BW9ObU3fRqZgM9RD0+52wV4tqKdp+ODrCi6YyfkQEAakxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=;
	b=XxFF7J//ue7sXd1kpaow5aA+QfK4Lq7trUrwoO83nPi9XV2poh/yfnJ4nEOzOV3QX7vB
	 DQsoHshFMeTDilnptbfBC7nNVzGsaiLbqDcXqsXmNcTT2m3B4lWNjWW4q8zmKnAsffT+l
	 1BnKhBY1quqL8qBm5+lZ4BG0UN0F3d8D9oXtPFbXtsVuubwLkck66F2nfxyZl5xXUTIiE
	 tUBMLwKD0Z71WIQachQKy1GlNXNON6p8xkDyb3dl2k3b88yOT1/+W0JOO9diRLfh1A5wS
	 gcjKRBU5bREggZBjfd3SdXiGF7OHERHZT+58F/ctgWhh5/4xwtT0NMRIhVG3xpoGolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzqhkUp9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+9m7u0z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBADB606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBADB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzqhkUp9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+9m7u0z
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1eS3475173
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=svF14fRerx1BSkQmBrzjUc
	fz3cY+DPEYvRHCJyqzfP0=; b=XzqhkUp9yxvizDH9n4WZ3/0ohqJSDyqGA8tknN
	3zLIxR5uhk8TsBb3hF77CAM8Ld/BYuYiKQnXLU2cO+xeYSq//UZdKIsz3KAiQaLh
	Zf4rsbP4yV3AuqtdJXtY07lhuLom/TZ8L+BINN+n0EFAeYsNvYvyNOTxIORHUW67
	sPbG6URbRRUNDzRCGrxXXIle99ORpnNgVMqW7QSIRGf+Gqtux2sEn8ZrCoKi7Hf6
	Ho7JbPweu4e09XLawQjH85jwWSpUz9JhqtXPDJ9LUxCWcYhhrpOOW5nTMaXrNDd0
	tiRVYp90f55m00LeBy+1bHc4C+t/yfU9rqKM1N7O4GoSp09Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tjkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0467a525eso26772775ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459325; x=1796064125; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=;
        b=Q+9m7u0zjZEEA/KcO3PQzQ5nm/65kJ7wPsjXrb7E8gV3ORX231GNj++4hEyPwAricU
         G4hnyligJNdo+X2w+aWF6UAnK3kdDnFvv9YMrMI+8AKkhoM/YdPeu1LxbthsIpR40Ve9
         /+IHKiiKkSeMO88OtAz136h/X5T5Qxf+O/G1MiPwz+FXnmCxKpQgxwQC30uAmaQ87O2N
         FLCR4ZslGTgSj9bxYq9GAUw1J/XlKaSb4aR6xWZP2RK5Zw2o6VUSrOp3GXBqNs3DsHUY
         9QrTLqGjgqiVpoawkYORxokehzjYFD0uEojXa5CRG1HTmKrSVAvwrrJqJX3cvRJhEO3r
         FPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459325; x=1796064125;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=svF14fRerx1BSkQmBrzjUcfz3cY+DPEYvRHCJyqzfP0=;
        b=MhxbAHlLuktUI5t/7NBIScKM3hXtavzfbqs+LHKZ3qcESUEnkFHOPki7cGqgETLy+p
         +1CCm2tNb6LqelOnrNHeY0dJrjtb5jc3EfDWpITAMQdJpSfF7MEVo0lCqAj5NJFHD5b9
         ofzBdHORCNk3F0AR4BCuzPj2Xn83b6gJhmHVtsdlYlqtpCjIpblzFXjkpx0NPHQd6ZVK
         GlT1+spxOumYBYRZeCUUe6q+gwseA/mRvPZn7usiYS23RbZbjRREQNiismDQuz8lpZei
         uyllF1m3no0lKEcE6NDMGSIWVUSZ03EGf43FFdHMgUAYXcqGofkOD8ZJDHvW0xdnRw5i
         aG9g==
X-Forwarded-Encrypted: i=1; AL+hErH3jRwGfl/hxoKBX6PK0/VvXnsMQc2jeYJsmEBdSqrUd2PBAH+gyS/H+1kJlkyCaSBNJNuMhE7lDbOliEoK@vger.kernel.org
X-Gm-Message-State: APuU4Z8wO57Hqz78y7KBOspFeIrGdWY138aveVOawPxhysoc0dIRthpi
	loJOeUTVGR18LcjLAuHb2daGODwZTxSvzYVQpM7LT18mgrQY+YTz6HMyGm3r0xj6PLGrk0BSKm4
	+iqDqFTa39yMwri9blPn0m9V0yeezA9R6ziSzwnNHosiFJszYk82M7dI0ctAHVjTIglx6
X-Gm-Gg: AZFdTZecrlvPX4KpGu+O/Oz+5z8UWJ7LIQpHRH+aXLDILR8IYpMbIQj3xLxr5Z+j/kq
	Ru9pqSX6Hr68zRgJ2Sm8+4g1Iz62qRvFm5ndHFTvSTV/wwZ5JgniwcqbUVhq87AsKdo/NBx0Wmy
	j8laTmraRY34YhEQv8nPgYLw/eS8MYizSmLyr5Sd+w+liF+DVoj+N2bzydQWGSzYTmE2uURovMI
	z3s7vx+LKInBWtqXn9W0ajev92EHz4+HFJk9EEqn6plvEp4v4zDw+ntFxzc6/FQdtpYxsnnEN2/
	4IZ96KAm0hUi6hCzTkkKF6gvDw8pkwRVUZdfZLQRQORHIFiKB3CS/SyILIRgZAk5XuUG/vaGtQJ
	BpaesLbIqbz6az8+s+m6UNFcjXAXh0w+fdkMZMhnPRzbE9USC65aCinMTTW2uVOy5Ac/5fPvrdq
	PwVpk=
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr112150815ad.45.1795459325415;
        Mon, 23 Nov 2026 10:42:05 -0800 (PST)
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr112150575ad.45.1795459324872;
        Mon, 23 Nov 2026 10:42:04 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm57984705ad.55.2026.11.23.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:42:04 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH RFC net-next 0/2] net: stmmac: qcom-ethqos: add support for
 RMII
Date: Tue, 24 Nov 2026 00:11:44 +0530
Message-Id: <20261124-ethqos_rmii-v1-0-1754643d593c@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOiIBGsC/yWMwQrCMBAFfyXs2YDZlmK9Cn6A1yKi8cWuYFqzU
 Qql/27U4zDMzKRIAqWtmSnhLSpDLOBWhnx/jjdYuRYmXnPjHFcWuX8OekoPERtabv2mDlyjoVK
 MCUGm362jw35nIrKNmDId/1Zflzt8/g5pWT5JJwbmfQAAAA==
X-Change-ID: 20261123-ethqos_rmii-f929c84f24e6
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459319; l=3039;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=Eozd2XBF6qkMrOFBsjC0iY8JAZG6nfTTy3vV5qFG3G8=;
 b=1/sjeU+R6y4z4oLE/0FhsjtnLl2ubfL0fg/7N75Gszao/o/5Kx4DkrG5BCFQt7g7t4ZIhOFHM
 KS/LQkOhiIWDPSFTNC1ObzAVDYpjjA11n/qet3vUye1jWdoYd+H/0Ib
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0488fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8 a=fnaMMcORItm61ZtTJu4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX2C3NZ4cPahTt
 dw7ftvp3nFf3+fTjSvbsqB1sAcm52GfB5GygB9ed0CHFVTkCNYn9UlO8C9dCusZdeTP99/2/0cS
 IkKwFr27CgdWEoWHMned/nI+CEomjJrDpCR1WGUoTfKYYzWpVONZ2sW7SQIbL42VctCZjPjXNvh
 /VNKryPL1TpjvHcIv8DQVW3vvbMwr69b70WGGhYkfe0htD8DWupAxEPFCBk287uZpdoFMYfVN9C
 9SkH83sOxR2iJV+V5+z/pDjYOa7liXQ7D1KdwrIw4oAWGvlwvpDBSpTBYBgq4qP8DmD4mJfPK2c
 oNM6Hfo9gz/FmWUWJ5FCIjvvC4QyyvCheRpWriIWd5NqT8CDKEkAC3s0sorjngrQEo9viAdq8YT
 yFtUalcySx65aI1O7mtHLNf91QPNqA59nAwvllGJcoTUQ+79/LWEXf7jXTkU4SGYQtjRr4UT5su
 8AZI0OHTb6L16GILyFQ==
X-Proofpoint-GUID: ZCRWXCvIDHBhhksswPlITZ0SsitwHj2G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX5PxIRbytnsd6
 IizHL1FWkpGDLR9CMBgVbEII7QgBRew72SWMf9siW61fLzhaLyf+dvFMr/XvLQkSnfiTaAxwjgD
 J/udEc0iv0MuX/ArKLtIhuJd8oQu3ko=
X-Proofpoint-ORIG-GUID: ZCRWXCvIDHBhhksswPlITZ0SsitwHj2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230074

Hi,

I am sending this RFC as I am looking for some feedback and inputs on
handling a HW quirk that affects the RMII PHY mode on the Qualcomm
ETHQOS controller. Maybe someone has seen similar behavior on other
platforms?

The Qualcomm ETHQOS core supports the RMII PHY mode, but only if you
ignore the dribble error, which is set in each receive descriptor. The
programming guide provides some details on why this happens, and an
excerpt is included below [0].

I initially thought about using a platform specific flag that would
ensure that the dribble error would only be ignored for the qcom-ethqos
+ "rmii" combination. But some digging pointed out the commit below,
which does something similar for norm_desc.c and enh_desc.c:

  commit 1cc5a735185a963ed9324a65e1f2db02bf52c0d4
  Author: Giuseppe CAVALLARO <peppe.cavallaro@st.com>
  Date:   Wed Feb 15 00:10:37 2012 +0000

  stmmac: do not discard frame on dribbling bit assert

  If this bit is set and the CRC error is reset, then the packet is
  valid. Only report this as stat info.

Apart from this, the wording in 802.3 around "Integer Number of Octets
in Frame" and "aAlignmentErrors" specifically calls out packets as
being error packets only if they do not pass the FCS check, although I
might be missing something here.

Anyway, this series has two patches - the first adds logic to accept
receive frames if the dribble error bit is the only error bit set in
the descriptors, and the second adds RMII support to the qcom-ethqos
driver. It has been tested with the KSZ8081RNB PHY attached to a Shikra
SoC based board. Since the programming guide mentions a generic
programming sequence for all SoCs, I have kept the platform glue logic
generic.

[0] Here's the excerpt from the ETHQOS programming guide (paraphrased
and shortened):
In RMII 10/100 receive mode, differences between the PHY's recovered
clock and the local reference clock can leave data temporarily buffered.
Consequently, CRS_DV may transition at a nibble boundary near the end of
a frame.

To handle this, software must ignore the dribble indication, RDES3[19],
while processing RMII receive write-back descriptors. The dribble
indication may contribute to the descriptor error summary even though
the complete octets and FCS are valid. Other receive errors remain
subject to normal validation and must not be masked.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (2):
      net: stmmac: dwmac4: accept dribble-only receive frames
      net: stmmac: qcom-ethqos: add RMII support

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 49 ++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |  1 +
 3 files changed, 53 insertions(+), 1 deletion(-)
---
base-commit: 5a1f6793361524314b442371dc05ce3cd4f2f838
change-id: 20261123-ethqos_rmii-f929c84f24e6

Best regards,
--  
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

