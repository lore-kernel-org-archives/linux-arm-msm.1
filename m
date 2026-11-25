Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634874;
	b=NNy041VKnxDHDtPhJLFfzKLiX+337IUIXz0YyiK6mj81LVP2ZHFT0dYOcFFlHJTK9lP3
	 XROGhWCh27nU1hNNIdHvIMSyJCMKqHVR3clAFuMlUUQ+s72wI5Jt/Nu02PJp88SctDoXU
	 Wvxj5vXDLgPUMQoLrs2+EvGS1W1+u6+wwBCztH5i/3A480rRpAbIo4BA91getkZHihvTY
	 emaqz9vHx4fjTENYNDzQ5RSDR7y+f5JNxQcxmF0Zz/l5IskOOJQSQU+BXu2k/DWLkxs1K
	 WXBW5RKpiVaQbMiTTt7BiYIhRqJ9dRu9L+sPFsldySUpFtKZQ5jpGi4wPxXvjUiJRCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634874;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=95k2Iy13yoDS+kywNlvIjNWyQBsXVtjAHDEMSkqvDoU=;
	b=T7Dt0EvR82drPdGIHrgCQrsVd6xAzg0NMtxa9OMHeE/zxCQEtQRpOiFjg8Aj6fwQxQvP
	 gmiBNte/bK2d2wdqlt+ALUAPgy+AJdqfGwHOw7IyJHBRwvp77V8t9/MpZqC8eUtA/Ekup
	 fX7FIzacG6N831/wdAOPkaGbIG7xoQkvp8r+AN6NF9/gbWNB/wgGOrcFT/JDDhiS2SqBU
	 yoRtSHqU1lGImZ+ldqwC+9y9gtOuuarnp8vgSYgujiGdbaX8WiIhzJn7UwIw4Rj/P17by
	 P/b6PqJ8swNdPDI02zPR5fsl5MHy0h8vFQyhddvtDSQnse7rIhLNw0S62xoz7iORg8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SERJ79tP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B068606A338;
	Wed, 25 Nov 2026 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SERJ79tP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C231F000D0;
	Wed, 25 Nov 2026 19:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795634873;
	bh=95k2Iy13yoDS+kywNlvIjNWyQBsXVtjAHDEMSkqvDoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SERJ79tP5g07W+n5+0WnXnUcHiRFiBFuuSZo28ea7dfOo43kYMdg5p3xmCDbgK3dd
	 jZacsV4RvnuJyhlaR4I5BqFlLwymQr08mJVYeL2jdg+4ACoOJKnnQwuOiDE4RmUNA3
	 jBAa4l3CKhuAlI+5h7N8Gr6XXHeXVNK9HbIYaA4B0S726xQe7pz+M+QTACrrio1UbM
	 vj+jaRw7Y/qBSHjdCGnh2eHVCNuMj1xpajQ13M37PD88gnPlNizqjiF3jTmT8KY3h7
	 nC4/9icD2EIx58RZil9eM+oRsmrdO0WjW6/RDTOBhIOvcFNmKyBoydsoYQ2E4NSVNF
	 iPzt/n/3512dw==
From: netdev-bot+sinfo@kernel.org
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
 hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
 sarosh.hasan@oss.qualcomm.com
Subject: Re: [PATCH net] net: stmmac: xgmac: fix RX split header length on
 multi-descriptor frames
Date: Wed, 25 Nov 2026 19:27:52 +0000
Message-ID: <179563487252.3294.9801787654778788859@kernel.org>
In-Reply-To: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
